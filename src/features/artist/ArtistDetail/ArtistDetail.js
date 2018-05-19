import React from 'react'
import { View, Text, ActivityIndicator } from 'react-native'
import images from '../../../common/assets/images'
import Icon from '../../../components/Icon/index'
import Theme from '../../../theme'
import TagGroup from '../../tag/TagGroup/index'
import WebLinkList from '../../webLink/WebLinkList/index'
import EventList from '../../releaseEvent/EventList/index'
import SongList from '../../song/SongList/index'
import ScrollableTabView from 'react-native-scrollable-tab-view'
import AlbumList from '../../album/AlbumList/index'
import Content from '../../../components/Content/index'
import Cover from '../../../components/Cover/index'
import Divider from '../../../components/Divider/index'
import SongHorizontalList from '../../song/SongHorizontalList'
import AlbumHorizontalList from '../../album/AlbumHorizontalList'
import AlbumGridView from '../../album/AlbumGridView'
import Expander from './../../../components/Expander'
import { SongRowList } from './../../song/songHOC'

class ArtistDetailPage extends React.Component {

    state = {
        shouldRender: false
    }

    componentDidMount () {
        const { params } = this.props.navigation.state;
        this.props.fetchArtist(params.id)

        setTimeout(() => { this.setState({ shouldRender: true }) }, 0)
    }

    render () {
        const artist = this.props.artist

        if(this.props.loading) {
            return (
                <View style={{ flex: 1 }}>
                    <ActivityIndicator size="large" color="#0000ff" />
                </View>
            )
        }

        if(!artist || !this.state.shouldRender) {
            return (<View></View>)
        }

        const { params } = this.props.navigation.state;
        const imageUri = (artist.image)? artist.iamge : images.getArtistUri(artist.id, artist.pictureMime)
        const { latestSongs, popularSongs, latestAlbums, popularAlbums, latestEvents } = this.props;
        const hasAlbum = (latestAlbums && latestAlbums.length > 0) || (popularAlbums && popularAlbums.length > 0)
        const hasSong = (latestSongs && latestSongs.length > 0) || (popularSongs && popularSongs.length > 0)
        const hasEvent = (latestEvents && latestEvents.length > 0)

        const Section = props => (<View style={[{ marginVertical: 8, paddingHorizontal: 4 },props.style]}>{props.children}</View>)

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

        const renderExpandableContent = () => {
            return (
                <Expander
                    content={
                        <View>
                            <RenderOrNull shouldRender={true}>
                                <Text style={[Theme.subhead, { padding: 8 }]}>Name</Text>
                                <View style={{ paddingHorizontal: 8 }}>
                                    <Text style={Theme.body} >{artist.name}</Text>
                                    <Text style={Theme.body} >{artist.additionalNames}</Text>
                                </View>
                            </RenderOrNull>
                            <RenderOrNull shouldRender={artist.description}>
                                <Text style={[Theme.subhead, { padding: 8 }]}>Description</Text>
                                <View style={{ paddingHorizontal: 8 }}>
                                    <Text style={Theme.body} >{artist.description}</Text>
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
                <TagGroup tags={artist.tags} max={5} onPressTag={this.props.onPressTag} />
            </Section>
        )

        const renderDescription = () => (
            <Section>
                <Text style={Theme.body}>{artist.description}</Text>
            </Section>
        )

        const renderPopularSongs = () => (
                <SongHorizontalList title='Popular songs' songs={popularSongs} onPressItem={this.props.onPressSong} />
        )

        const renderPopularAlbums = () => (
                <AlbumHorizontalList title='Popular albums' albums={popularAlbums} onPressItem={this.props.onPressAlbum} />
        )

        const renderWebLink = () => (
            <Section>
                <Divider />
                <WebLinkList webLinks={artist.webLinks} category='Official' title='Official' />
                <WebLinkList webLinks={artist.webLinks} category='Commercial' title='Commercial' />
                <WebLinkList webLinks={artist.webLinks} category='Reference' title='Reference' />
            </Section>
        )

        const renderInfoPage = (
            <Content tabLabel='Info'>
                <Cover
                    imageUri={artist.image}
                    title={artist.name}
                    subtitle={artist.artistType}
                />
                <Section style={{ flex: 1, flexDirection: 'row', alignItems: 'center', justifyContent: 'space-around' }}>
                    {!this.props.followed && <Icon name='md-heart' text='Follow' onPress={() => this.props.onPressFollow(artist)} />}
                    {this.props.followed && <Icon name='md-heart' text='Followed' color={Theme.buttonActiveColor} onPress={() => this.props.onPressUnFollow(artist)} />}
                    <Icon name='md-share' text='Share' onPress={() => this.props.onPressShare(artist)} />
                    <Icon name='md-globe' text='VocaDB' onPress={() => this.props.onPressToVocaDB(artist)} />
                </Section>
                {renderExpandableContent()}
                {artist.tags != undefined && renderTagGroup()}
                {popularSongs && popularSongs.length > 0 && renderPopularSongs()}
                {popularAlbums && popularAlbums.length > 0 && renderPopularAlbums()}
                {artist.webLinks != undefined && renderWebLink()}
            </Content>
        )

        const EventListPage = () => (
            <Content>
                <EventList events={latestEvents} onPressItem={this.props.onPressEvent} />
            </Content>
        )

        return (
            <ScrollableTabView>
                {renderInfoPage}
                {latestSongs && latestSongs.length > 0 && <SongRowList tabLabel='Songs' data={latestSongs} onPressItem={this.props.onPressSong} />}
                {hasAlbum && <AlbumGridView tabLabel='Albums' albums={latestAlbums} onPressItem={this.props.onPressAlbum} />}
                {hasEvent && <EventListPage tabLabel='Events' />}
            </ScrollableTabView>
        )
    }
}

export default ArtistDetailPage