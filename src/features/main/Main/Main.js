import React from 'react'
import ScrollableTabView from 'react-native-scrollable-tab-view'
import { Linking, DeviceEventEmitter } from 'react-native'
import CustomTabBar from '../../../components/CustomTabBar'
import HomeTab from './../HomeTab'
import MenuTab from './../MenuTab'
import FollowedTab from './../FollowedTab'
import SongRankingTab from './../../song/SongRanking'
import QuickActions from 'react-native-quick-actions'
import { shortcutTypes } from './../../../common/constants/shortcuts'

class Main extends React.PureComponent {


    componentWillMount () {

        QuickActions.popInitialAction().then((action) => {
            if(action && action.type) {
                switch (action.type) {
                    case shortcutTypes.Songs:
                        this.props.onPressSongSearch();
                        break;
                    case shortcutTypes.Artists:
                        this.props.onPressArtistSearch();
                        break;
                    case shortcutTypes.Albums:
                        this.props.onPressAlbumSearch();
                        break;
                    default:
                        console.log('Invalid action : ' + JSON.stringify(d))
                }
            }
        }).catch(console.error)

    }

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

        const openLink = (url) => Linking.openURL(url).catch(err => console.error('An error occurred', err))

        const menus =  [
            { icon: 'ios-log-in', text: 'Sign in', onPress: this.props.onPressSignOut, onlyGuest: true },
            { icon: 'ios-musical-notes', text: 'Favorite songs', onPress: this.props.onPressMenuFavoriteSongs },
            { icon: 'ios-disc', text: 'Collections', onPress: this.props.onPressMenuFavoriteAlbums },
            { icon: 'ios-people', text: 'Followed artists', onPress: this.props.onPressMenuFollowArtists },
            { icon: 'ios-globe', text: 'VocaDB website', onPress: () => openLink('https://vocadb.net') },
            { icon: 'ios-settings', text: 'Settings', onPress: this.props.onPressMenuSettings },
            { icon: 'logo-github', text: 'About', onPress: () => openLink('https://github.com/VocaDB/VocaDB-App') },
            { icon: 'ios-log-out', text: 'Sign out', onPress: this.props.onPressSignOut, onlyMember: true }
        ];

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
                    onPressTagSearch={this.props.onPressTagSearch}
                    onPressMoreRecentSongs={this.props.onPressMoreRecentSongs}
                    onPressMoreRecentAlbums={this.props.onPressMoreRecentAlbums}
                    onPressMoreTopAlbums={this.props.onPressMoreTopAlbums}
                    onPressMoreLatestEvent={this.props.onPressMoreLatestEvent} />
                <SongRankingTab
                    tabLabel="ios-stats"
                    songs={this.props.rankingSongs}
                    durationHours={this.props.rankingState.durationHours}
                    filterBy={this.props.rankingState.filterBy}
                    vocalist={this.props.rankingState.vocalist}
                    onDurationHoursChanged={this.props.onDurationHoursChanged}
                    onFilterByChanged={this.props.onFilterByChanged}
                    onVocalistChanged={this.props.onVocalistChanged}
                    onPressSong={this.props.onPressSong}
                />
                <FollowedTab
                    tabLabel="ios-heart"
                    refreshing={this.props.refreshing}
                    refresh={this.refreshFollowedSongs.bind(this)}
                    onFetchMore={this.props.fetchFollowedSongs}
                    songs={this.props.followedSongs}
                    onPressSong={this.props.onPressSong} />
                <MenuTab
                    tabLabel="ios-menu"
                    menus={menus} />
            </ScrollableTabView>
        )
    }
}

export default Main;