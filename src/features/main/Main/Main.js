import React from 'react'
import ScrollableTabView from 'react-native-scrollable-tab-view'
import CustomTabBar from '../../../components/CustomTabBar'
import HomeTab from './../HomeTab'
import MenuTab from './../MenuTab'
import FollowedTab from './../FollowedTab'

export default class Main extends React.PureComponent {

    componentDidMount () {
        this.refreshHome()
        this.refreshFollowedSongs()
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

    render () {

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
                    onFetchMore={this.props.fetchFollowedSongs}
                    songs={this.props.followedSongs}
                    onPressSong={this.props.onPressSong} />
                <MenuTab
                    tabLabel="ios-menu"
                    onPressMenuFavoriteSongs={this.props.onPressMenuFavoriteSongs}
                    onPressMenuFollowArtists={this.props.onPressMenuFollowArtists} />
            </ScrollableTabView>
        )
    }
}