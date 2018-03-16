import React from 'react'
import { View, Text, ScrollView, RefreshControl, TouchableOpacity } from 'react-native'
import SongList from '../../song/SongList/index'
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
                        <TouchableOpacity style={{ alignItems: 'center' }} onPress={() => {}}>
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

                <SongList
                    title='Recent songs'
                    max={5} showHeader={true}
                    songs={this.props.recentSongs}
                    onPressItem={this.props.onPressSong}
                    onPressMore={this.props.onPressMoreRecentSongs} />

                <Divider height={14} />

                <AlbumList
                    title='Recent albums'
                    max={10}
                    horizontal={true}
                    showHeader={true}
                    albums={this.props.recentAlbums}
                    onPressItem={this.props.onPressAlbum} />

                <Divider height={14} />

                <EventList
                    title='Latest events'
                    max={5}
                    events={this.props.latestEvents}
                    onPressItem={this.props.onPressEvent}
                    onPressMore={() => console.log(' Press more ')} />

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