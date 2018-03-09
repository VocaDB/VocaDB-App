import React from 'react'
import { View, Text, ScrollView, RefreshControl } from 'react-native'
import SongList from '../../modules/song/SongList'
import AlbumList from '../../modules/album/AlbumList'
import ScrollableTabView from 'react-native-scrollable-tab-view'
import CustomTabBar from './../../components/CustomTabBar'
import EventList from '../../modules/releaseEvent/EventList'
import Content from './../../components/Content'
import CenterView from './../../components/CenterView'
import Icon from './../../components/Icon'
import { ListItem, Button } from 'react-native-material-ui';
import Divider from './../../components/Divider'
import Theme from './../../theme'

export default class HomePage extends React.Component {

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

                <View>

                    <View style={{ margin: 8 }}>
                        <Text style={Theme.subhead}>Search for</Text>
                    </View>

                    <View style={{ flexDirection: 'row', height: 72, justifyContent: 'space-around' }}>
                        <View>
                            <Icon name='ios-musical-notes' text='Song' color='#546E7A' onPress={this.props.onPressSongSearch} />
                        </View>
                       <View>
                           <Icon name='ios-person' text='Artist' color='#546E7A' />
                       </View>
                        <View>
                            <Icon name='ios-disc' text='Album' color='#546E7A' />
                        </View>
                        <View>
                            <Icon name='ios-calendar' text='Event' color='#546E7A' />
                        </View>
                    </View>
                </View>

                <Divider height={14} />

                <AlbumList
                    title='Recent albums'
                    max={10}
                    horizontal={true}
                    showHeader={true}
                    albums={this.props.recentAlbums}
                    onPressItem={this.props.onPressAlbum} />

                <Divider height={14} />

                <SongList
                    title='Recent songs'
                    max={5} showHeader={true}
                    songs={this.props.recentSongs}
                    onPressItem={this.props.onPressSong}
                    onPressMore={this.props.onPressMoreRecentSongs} />

            </Content>
        )

        const FollowedTabPage = () => (
            <ScrollView>
                <SongList songs={this.props.followedSongs} onPressItem={this.props.onPressSong} />
            </ScrollView>
        )

        const EventTabPage = () => (
            <ScrollView>
                <EventList events={this.props.latestEvents} onPressItem={this.props.onPressEvent} />
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