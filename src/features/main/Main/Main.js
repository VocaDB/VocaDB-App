import React from 'react'
import { View, Text, ScrollView, RefreshControl, TouchableOpacity } from 'react-native'
import SongList from '../../song/SongList'
import SongCard from '../../song/SongCard'
import AlbumCard from '../../album/AlbumCard'
import EventCard from '../../releaseEvent/EventCard'
import ScrollableTabView from 'react-native-scrollable-tab-view'
import CustomTabBar from '../../../components/CustomTabBar'
import Content from '../../../components/Content'
import Divider from '../../../components/Divider'
import Theme from '../../../theme'
import { Avatar } from 'react-native-material-ui';
import FeatureList from './../FeatureList'
import MenuTab from './../MenuTab'
import FollowedTab from './../FollowedTab'

export default class Main extends React.Component {

    componentDidMount () {
        this.refresh()
    }

    refresh () {
        this.props.fetchRecentSongs()
        this.props.fetchLatestEvents()
        this.props.fetchRecentAlbums()
        this.props.fetchFollowedSongs()
    }

    render () {

        const renderSongCard = song => (
            <SongCard key={song.id}
                      id={song.id}
                      name={song.defaultName}
                      artist={song.artistString}
                      image={song.thumbUrl}
                      onPress={() => this.props.onPressSong(song)} />
        )

        const renderAlbumCard = album => (
            <AlbumCard key={album.id}
                       id={album.id}
                       name={album.defaultName}
                       onPress={() => this.props.onPressAlbum(album)} />
        )

        const renderEventCard = event => {
            const thumbnailUrl = (event.mainPicture) ? event.mainPicture.urlThumb.replace('mainThumb', 'mainOrig') : undefined
            return (
                <EventCard  key={event.id}
                            name={event.name}
                            thumbnail={thumbnailUrl}
                            location={event.venueName}
                            date={event.date}
                            onPress={() => this.props.onPressEvent(event)} />
            )
        }


        const renderFeatureList = (title, items, renderItem, onPressMore) => (
            <FeatureList
                title={title}
                items={items.map(renderItem)}
                onPressMore={this.props.onPressMoreRecentSongs} />
        )

        const HomeTabPage = () => (
            <Content refreshControl={
                <RefreshControl
                    refreshing={this.props.refreshing}
                    onRefresh={this.refresh.bind(this)}
                />}>

                <View style={{ marginVertical: 16 }}>

                    <View style={{ flexDirection: 'row', height: 72, justifyContent: 'space-around' }}>
                        <TouchableOpacity style={{ alignItems: 'center' }} onPress={this.props.onPressSongSearch}>
                            <Avatar icon='music-note' />
                            <Text style={Theme.caption}>Songs</Text>
                        </TouchableOpacity>
                        <TouchableOpacity style={{ alignItems: 'center' }} onPress={this.props.onPressArtistSearch}>
                            <Avatar icon='person' />
                            <Text style={Theme.caption}>Artist</Text>
                        </TouchableOpacity>
                        <TouchableOpacity style={{ alignItems: 'center' }} onPress={() => {}}>
                            <Avatar icon='album' />
                            <Text style={Theme.caption}>Album</Text>
                        </TouchableOpacity>
                        <TouchableOpacity style={{ alignItems: 'center' }} onPress={() => {}}>
                            <Avatar icon='event' />
                            <Text style={Theme.caption}>Event</Text>
                        </TouchableOpacity>
                    </View>
                </View>

                <Divider height={14} />

                <View style={{ paddingBottom: 16}}>
                    {renderFeatureList('Recent songs', this.props.recentSongs, renderSongCard, this.props.onPressMoreRecentSongs)}

                    <Divider height={14} />

                    {renderFeatureList('Recent albums', this.props.recentAlbums, renderAlbumCard, this.props.onPressMoreRecentSongs)}

                    <Divider height={14} />

                    {renderFeatureList('Latest events', this.props.latestEvents, renderEventCard, this.props.onPressMoreRecentSongs)}
                </View>

            </Content>
        )

        return (
            <ScrollableTabView renderTabBar={() => <CustomTabBar />}>
                <HomeTabPage tabLabel="ios-home" />
                <FollowedTab tabLabel="ios-heart" songs={this.props.followedSongs} onPressSong={this.props.onPressSong} />
                <MenuTab tabLabel="ios-menu"></MenuTab>
            </ScrollableTabView>
        )
    }
}