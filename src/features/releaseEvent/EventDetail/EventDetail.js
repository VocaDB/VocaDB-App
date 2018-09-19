import React from 'react';
import ScrollableTabView from 'react-native-scrollable-tab-view';
import { View, Text } from 'react-native';
import Icon from '../../../components/Icon/index';
import { SongRowList } from '../../song/songHOC';
import AlbumGridView from '../../album/AlbumGridView';
import Content from '../../../components/Content/index';
import Theme from '../../../theme';
import moment from 'moment';
import WebLinkList from '../../webLink/WebLinkList';
import ArtistRoleList from '../../artistRole/ArtistRoleList';
import Cover from '../../../components/Cover/index';
import { SongRankingList } from './../../song/songHOC';
import i18n from './../../../common/i18n';

class EventDetail extends React.Component {

    state = {
        shouldRender: false
    }

    componentDidMount () {
        const { params } = this.props.navigation.state;
        if(params) {
            this.props.fetchEvent(params.id);
        }

        setTimeout(() => { this.setState({ shouldRender: true }) }, 0);
    }

    render () {
        const event = this.props.event
        const artists = this.props.artists;

        if(!event || !this.state.shouldRender) {
            return (<View></View>)
        }

        const webLinks = (event.webLinks)? event.webLinks : []

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

        const SectionHeader = props => (<Text style={[Theme.subhead, { marginVertical: 8 }]}>{props.text}</Text>)

        const Section = props => (<View style={[{ marginVertical: 8, paddingHorizontal: 4 },props.style]}>{props.children}</View>)

        const renderInfoPage = (
            <Content tabLabel={i18n.info}>
                <Cover
                    imageUri={event.image}
                    title={event.name}
                    subtitle={event.category}
                />
                <View>
                    <Section style={{ flex: 1, flexDirection: 'row', alignItems: 'center', justifyContent: 'space-around' }}>
                        <Icon name='md-share' text={i18n.share} onPress={() => this.props.onPressShare(event)} />
                        <Icon name='md-globe' text='VocaDB' onPress={() => this.props.onPressToVocaDB(event)} />
                    </Section>

                    <RenderOrNull shouldRender={(event && event.date)}>
                        <SectionHeader text={i18n.date} />
                        <Text style={Theme.body}>{moment(event.date).format('LL') + ` (${moment(event.date).fromNow()})`}</Text>
                    </RenderOrNull>

                    <RenderOrNull shouldRender={(event && event.venueName)}>
                        <SectionHeader text={i18n.venue} />
                        <Text style={Theme.body}>{event.venueName}</Text>
                    </RenderOrNull>

                    <RenderOrNull shouldRender={(this.props.series && this.props.series.id)}>
                        <SectionHeader text={i18n.series} />
                        <Text style={Theme.body}>{this.props.series.name}</Text>
                    </RenderOrNull>

                    <RenderOrNull shouldRender={(event && event.description)}>
                        <SectionHeader text={i18n.description} />
                        <Text style={Theme.body}>{event.description}</Text>
                    </RenderOrNull>

                    <RenderOrNull shouldRender={(webLinks && webLinks.length)}>
                        <SectionHeader text={i18n.relatedLink} />
                        <WebLinkList webLinks={webLinks} />
                    </RenderOrNull>

                    <RenderOrNull shouldRender={(this.props.songListSongs && this.props.songListSongs.length)}>
                        <SectionHeader text={i18n.setlist} />
                        <SongRankingList data={this.props.songListSongs} />
                    </RenderOrNull>

                    <View style={{ height: 18 }} />
                </View>
            </Content>
        )

        const SongListPage = () => (
            <Content>
                <SongRowList data={this.props.songs} onPressItem={this.props.onPressSong} />
            </Content>
        )

        const ArtistRoleListPage = () => (
            <Content>
                <ArtistRoleList artists={artists} onPressItem={this.props.onPressArtist} groupBy='effectiveRoles' displayRole />
            </Content>
        )

        const AlbumListPage = () => (
            <Content>
                <AlbumGridView albums={this.props.albums} onPressItem={this.props.onPressAlbum} />
            </Content>
        )

        const hasSong = (this.props.songs && this.props.songs.length)? true : false
        const hasAlbum = (this.props.albums && this.props.albums.length)? true : false
        const hasArtist = (artists && artists.length > 0)? true : false;

        if(!hasSong && !hasAlbum) {
            return renderInfoPage
        }

        return (
            <ScrollableTabView>
                {renderInfoPage}
                {hasArtist && <ArtistRoleListPage tabLabel={`${i18n.artists} (${artists.length})`} />}
                {hasSong && <SongListPage tabLabel={`${i18n.songs} (${this.props.songs.length})`} />}
                {hasAlbum && <AlbumListPage tabLabel={`${i18n.albums} (${this.props.albums.length})`} />}
            </ScrollableTabView>
        )
    }
}

export default EventDetail