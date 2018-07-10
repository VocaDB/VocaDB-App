import React from 'react';
import { View, Text } from 'react-native';
import images from '../../../common/assets/images';
import Icon from '../../../components/Icon/index';
import Theme from '../../../theme';
import TagGroup from '../../tag/TagGroup/index';
import WebLinkList from '../../webLink/WebLinkList/index';
import EventList from '../../releaseEvent/EventList/index';
import ScrollableTabView from 'react-native-scrollable-tab-view';
import ArtistRoleList from '../../artistRole/ArtistRoleList/index';
import Cover from '../../../components/Cover/index';
import Content from '../../../components/Content/index';
import TrackList from '../../track/TrackList/index';
import Divider from '../../../components/Divider/index';
import Expander from './../../../components/Expander';
import StarRating from 'react-native-star-rating';
import PVList from '../../pv/PVLIst/index';
import i18n from './../../../common/i18n';

class AlbumDetail extends React.Component {

    state = {
        shouldRender: false
    }

    componentDidMount () {
        const { params } = this.props.navigation.state;
        this.props.fetchAlbum(params.id)

        setTimeout(() => { this.setState({ shouldRender: true }) }, 0);
    }

    render () {

        const album = this.props.album

        if(!album || !this.state.shouldRender) {
            return (<View></View>)
        }

        const { params } = this.props.navigation.state;
        const imageUri = (album.image)? album.image : images.getAlbumUri(params.id, album.coverPictureMime)

        const Section = props => (<View style={[{ paddingHorizontal: 4 },props.style]}>{props.children}</View>)

        const RenderOrNull = props => {
            if(props.shouldRender) {
                return (
                    <View style={{ padding: 8 }}>
                        {props.children}
                    </View>
                )
            }

            return null;
        }

        const renderAdditionalInfo = () => (
            <Section style={{ flex: 1, flexDirection: 'row', alignItems: 'center', justifyContent: 'space-around', padding: 8, backgroundColor: '#2C486E' }}>

                <View style={{ alignItems: 'center' }}>
                    <View style={{ padding: 4 }}>
                        <Text style={Theme.boxValue}>{album.ratingAverage}</Text>
                    </View>
                    <View style={{ alignItems: 'center', justifyContent: 'center' }}>
                        <StarRating
                            disabled
                            maxStars={5}
                            rating={album.ratingAverage}
                            starStyle={{}}
                            fullStarColor='white'
                            halfStarColor='white'
                            starSize={14}
                        />
                    </View>

                </View>

                <View style={{ alignItems: 'center'}}>
                    <View  style={{ padding: 4 }}>
                        <Text style={Theme.boxValue}>{album.discType}</Text>
                    </View>
                    <Text style={Theme.boxTitle}>{i18n.discType}</Text>
                </View>

                <View style={{ alignItems: 'center'}}>
                    <View  style={{ padding: 4 }}>
                        <Text style={Theme.boxValue}>{(album && album.releaseDate && album.releaseDate.formatted)? album.releaseDate.formatted : 'Unknown'}</Text>
                    </View>
                    <Text style={Theme.boxTitle}>{i18n.releaseDate}</Text>
                </View>
            </Section>
        )

        const renderExpandableContent = () => {
            return (
                <Expander
                    content={
                        <View>
                            <RenderOrNull shouldRender={true}>
                                <Text style={[Theme.subhead, { padding: 8 }]}>{i18n.name}</Text>
                                <View style={{ paddingHorizontal: 8 }}>
                                    <Text style={Theme.body} >{album.name}</Text>
                                    <Text style={Theme.body} >{album.additionalNames}</Text>
                                </View>
                            </RenderOrNull>
                            <RenderOrNull shouldRender={album.description}>
                                <Text style={[Theme.subhead, { padding: 8 }]}>{i18n.description}</Text>
                                <View style={{ paddingHorizontal: 8 }}>
                                    <Text style={Theme.body} >{album.description}</Text>
                                </View>
                            </RenderOrNull>
                        </View>

                    }
                />
            )
        }

        const renderTagGroup = () => (
            <Section>
                <Divider />
                <TagGroup tags={album.tags} max={5} onPressTag={this.props.onPressTag} />
            </Section>
        )

        const renderTracks = () => (
            <Section>
                <Divider />
                <TrackList tracks={album.tracks} onPressItem={this.props.onPressTrack} />
            </Section>
        )

        const renderPVList = () => (
            <Section>
                <Divider />
                <PVList pvs={album.pvs} title={i18n.ads} showHeader />
            </Section>
        )

        const renderWebLinks = () => (
            <Section>
                <Divider />
                <WebLinkList webLinks={album.webLinks} category='Official' title='Official' />
                <WebLinkList webLinks={album.webLinks} category='Commercial' title='Commercial' />
                <WebLinkList webLinks={album.webLinks} category='Reference' title='Reference' />
            </Section>
        )

        const ArtistRoleListPage = () => (
            <Content>
                <ArtistRoleList artists={album.artists} onPressItem={this.props.onPressArtist} />
            </Content>
        )

        const EventListPage = () => (
            <Content>
                <EventList events={album.releaseEvents} />
            </Content>
        )

        return (
            <ScrollableTabView>
                <Content tabLabel='Info'>
                    <Cover
                        imageUri={imageUri}
                        title={album.name}
                        subtitle={album.artistString}
                    />

                    {renderAdditionalInfo()}

                    <Section style={{ flex: 1, flexDirection: 'row', alignItems: 'center', justifyContent: 'space-around' }}>
                        {!this.props.isFavoriteAlbum && <Icon name='md-heart' text={i18n.add} onPress={() => this.props.onPressAddFavorite(album)} />}
                        {this.props.isFavoriteAlbum && <Icon name='md-heart' text={i18n.add} color={Theme.buttonActiveColor} onPress={() => this.props.onPressRemoveFavorite(album)} />}
                        <Icon name='md-share' text={i18n.share} onPress={() => this.props.onPressShare(album)} />
                        <Icon name='md-globe' text='VocaDB' onPress={() => this.props.onPressToVocaDB(album)} />
                    </Section>

                    {renderExpandableContent()}

                    {album.tags && album.tags.length > 0 && renderTagGroup()}
                    {album.pvs && album.pvs.length > 0 && renderPVList()}
                    {album.tracks && album.tracks.length > 0 && renderTracks()}
                    {album.webLinks && album.webLinks.length > 0 && renderWebLinks()}

                </Content>
                <ArtistRoleListPage tabLabel={i18n.artists} />
                {album.releaseEvents && album.releaseEvents.length > 0 && <EventListPage tabLabel={i18n.events} />}
            </ScrollableTabView>
        )
    }
}

export default AlbumDetail