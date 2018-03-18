import React from 'react'
import { View, Text, ScrollView, RefreshControl, TouchableOpacity } from 'react-native'
import SongList from '../../song/SongList/index'
import SongCard from '../../song/SongCard'
import AlbumCard from '../../album/AlbumCard'
import EventCard from '../../releaseEvent/EventCard'
import AlbumList from '../../album/AlbumList/index'
import ScrollableTabView from 'react-native-scrollable-tab-view'
import CustomTabBar from '../../../components/CustomTabBar/index'
import EventList from '../../releaseEvent/EventList/index'
import Content from '../../../components/Content/index'
import CenterView from '../../../components/CenterView/index'
import Icon from '../../../components/Icon/index'
import { ListItem, Button } from 'react-native-material-ui';
import Divider from '../../../components/Divider/index'
import Theme from '../../../theme'
import { Avatar } from 'react-native-material-ui';
import FeatureList from './../FeatureList'

export default class Home extends React.Component {

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

        const FollowedTabPage = () => (
            <ScrollView>
                <SongList songs={this.props.followedSongs} onPressItem={this.props.onPressSong} />
            </ScrollView>
        )

        const createMenuItem = (icon, text, onPress) => (
            <ListItem
                leftElement={<Icon name={icon} pureIcon />}
                centerElement={{
                    primaryText: text,
                }}
                onPress={onPress}
            />
        )

        const MenuTabPage =() => (
            <View style={{ flex: 1 }}>
                <CenterView>
                    <Text style={[Theme.subhead,{ margin: 8 }]}>This app is still under development.</Text>
                    <Button raised text="Sign in" />
                </CenterView>
                <View style={{ flex: 1, backgroundColor: 'white' }}>
                    {createMenuItem('ios-people', 'Followed artists', this.props.onPressMenuFollowArtists)}
                    <Divider />
                    {createMenuItem('ios-settings', 'Settings', () => {})}
                    {createMenuItem('ios-lock', 'Terms & privacy policy', () => {})}
                    {createMenuItem('ios-help-circle', 'Help & feedback', () => {})}
                </View>
            </View>
        )

        return (
            <ScrollableTabView renderTabBar={() => <CustomTabBar />}>
                <HomeTabPage tabLabel="ios-home" />
                <FollowedTabPage tabLabel="ios-heart" />
                <MenuTabPage tabLabel="ios-menu"></MenuTabPage>
            </ScrollableTabView>
        )
    }
}