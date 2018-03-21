import React from 'react'
import ScrollableTabView from 'react-native-scrollable-tab-view'
import { View } from 'react-native'
import { BottomNavigation } from 'react-native-material-ui';
import CustomTabBar from '../../../components/CustomTabBar'
import HomeTab from './../HomeTab'
import MenuTab from './../MenuTab'
import FollowedTab from './../FollowedTab'

const TabState = {
    HOME: 'home',
    FOLLOWED: 'followed',
    MENU: 'menu'

}

export default class Main extends React.Component {

    constructor(props) {
        super(props)
        this.state = {
            active: 'home'
        }
    }

    componentDidMount () {
        this.refreshHome()
    }

    refreshHome () {
        this.props.fetchHighlighted()
        this.props.fetchTopAlbums()
        this.props.fetchLatestEvents()
        this.props.fetchRecentAlbums()

    }

    refreshFollowedSongs () {
        this.props.fetchFollowedSongs()
    }

    render2 () {

        return (
            <ScrollableTabView renderTabBar={() => <CustomTabBar />}>
                <HomeTab
                    tabLabel="ios-home"
                    refreshing={this.props.refreshing}
                    refresh={this.refreshHome.bind(this)}
                    recentSongs={this.props.recentSongs}
                    recentAlbums={this.props.recentAlbums}
                    topAlbums={this.props.topAlbums}
                    latestEvents={this.props.latestEvents}
                    onPressSong={this.props.onPressSong}
                    onPressAlbum={this.props.onPressAlbum}
                    onPressEvent={this.props.onPressEvent}
                    onPressSongSearch={this.props.onPressSongSearch}
                    onPressArtistSearch={this.props.onPressArtistSearch}
                    onPressAlbumSearch={this.props.onPressAlbumSearch}
                    onPressEventSearch={this.props.onPressEventSearch}
                    onPressMoreRecentSongs={this.props.onPressMoreRecentSongs}
                    onPressMoreRecentAlbums={this.props.onPressMoreRecentAlbums}
                    onPressMoreLatestEvent={this.props.onPressMoreLatestEvent} />
                <FollowedTab
                    tabLabel="ios-heart"
                    refreshing={this.props.refreshing}
                    refresh={this.refreshFollowedSongs.bind(this)}
                    songs={this.props.followedSongs}
                    onPressSong={this.props.onPressSong} />
                <MenuTab tabLabel="ios-menu"></MenuTab>
            </ScrollableTabView>
        )
    }

    render () {
        return (
            <View style={{ flex: 1 }}>
                <View style={{ flex: 1 }}>
                    {this.state.active === TabState.HOME && <HomeTab
                        tabLabel="ios-home"
                        refreshing={this.props.refreshing}
                        refresh={this.refreshHome.bind(this)}
                        recentSongs={this.props.recentSongs}
                        recentAlbums={this.props.recentAlbums}
                        topAlbums={this.props.topAlbums}
                        latestEvents={this.props.latestEvents}
                        onPressSong={this.props.onPressSong}
                        onPressAlbum={this.props.onPressAlbum}
                        onPressEvent={this.props.onPressEvent}
                        onPressSongSearch={this.props.onPressSongSearch}
                        onPressArtistSearch={this.props.onPressArtistSearch}
                        onPressAlbumSearch={this.props.onPressAlbumSearch}
                        onPressEventSearch={this.props.onPressEventSearch}
                        onPressMoreRecentSongs={this.props.onPressMoreRecentSongs}
                        onPressMoreRecentAlbums={this.props.onPressMoreRecentAlbums}
                        onPressMoreLatestEvent={this.props.onPressMoreLatestEvent} />}

                    {this.state.active === TabState.FOLLOWED && <FollowedTab
                        tabLabel="ios-heart"
                        refreshing={this.props.refreshing}
                        refresh={this.refreshFollowedSongs.bind(this)}
                        songs={this.props.followedSongs}
                        onPressSong={this.props.onPressSong} />}

                    {this.state.active === TabState.MENU && <MenuTab tabLabel="ios-menu"></MenuTab>}
                </View>
                <BottomNavigation active={this.state.active} hidden={false} >
                    <BottomNavigation.Action
                        key="home"
                        icon="home"
                        label="Home"
                        onPress={() => this.setState({ active: TabState.HOME })}
                    />
                    <BottomNavigation.Action
                        key="favorite"
                        icon="favorite"
                        label="Followed"
                        onPress={() => this.setState({ active: TabState.FOLLOWED })}
                    />
                    <BottomNavigation.Action
                        key="menu"
                        icon="menu"
                        label="Menu"
                        onPress={() => this.setState({ active: TabState.MENU })}
                    />
                </BottomNavigation>
            </View>
        )
    }
}