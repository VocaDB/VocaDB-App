import React from 'react';
import ScrollableTabView from 'react-native-scrollable-tab-view';
import { Linking, DeviceEventEmitter, Alert } from 'react-native';
import CustomTabBar from '../../../components/CustomTabBar';
import HomeTab from './../HomeTab';
import MenuTab from './../MenuTab';
import FollowedTab from './../FollowedTab';
import SongRankingTab from './../../song/SongRanking';
import QuickActions from 'react-native-quick-actions';
import { shortcutTypes } from './../../../common/constants/shortcuts';
import i18n from './../../../common/i18n';
import firebase from 'react-native-firebase';

const tabs = [ 'Home', 'SongRanking', 'Followed', 'Menu'];

class Main extends React.PureComponent {


    componentWillMount () {

        QuickActions.popInitialAction().then((action) => {
            if(action && action.type) {
                switch (action.type) {
                    case shortcutTypes.Songs:
                        this.props.onPressSongSearchShortcut();
                        break;
                    case shortcutTypes.Artists:
                        this.props.onPressArtistSearchShortcut();
                        break;
                    case shortcutTypes.Albums:
                        this.props.onPressAlbumSearchShortcut();
                        break;
                    default:
                        console.log('Invalid action : ' + JSON.stringify(action));
                }
            }
        }).catch(console.error);

    }


    componentDidUpdate (prevProps, prevState) {
        if(this.props.error) {
            Alert.alert("Error", this.props.error.message)
        }

        if(this.props.message) {
            Alert.alert("Info", this.props.message)
        }
    }

    componentDidMount () {
        this.refreshHome();
        this.refreshFollowedSongs();
        this.props.clearSinglePageState();
    }

    refreshHome () {
        this.props.fetchHighlighted();
        this.props.fetchTopAlbums();
        this.props.fetchLatestEvents();
        this.props.fetchRecentAlbums();
        this.props.fetchRunningEventSongs();
    }

    refreshFollowedSongs () {
        this.props.fetchFollowedSongs();
    }

    render () {
        const openLink = (url) => Linking.openURL(url).catch(err => console.error('An error occurred', err));

        const menus =  [
            { icon: 'ios-log-in', text: 'Sign in', onPress: this.props.onPressSignOut, onlyGuest: true },
            { icon: 'ios-cloud-download', text: 'Import', onPress: this.props.onPressImport },
            { icon: 'ios-cloud-upload', text: 'Export', onPress: this.props.onPressExport },
            { icon: 'ios-musical-notes', text: i18n.favoriteSongs, onPress: this.props.onPressMenuFavoriteSongs },
            { icon: 'ios-disc', text: i18n.favoriteAlbums, onPress: this.props.onPressMenuFavoriteAlbums },
            { icon: 'ios-people', text: i18n.favoriteArtists, onPress: this.props.onPressMenuFollowArtists },
            { icon: 'ios-settings', text: i18n.settings, onPress: this.props.onPressMenuSettings },
            { icon: 'ios-information-circle', text: 'ติดต่อ & ข้อเสนอแนะ', onPress: this.props.onPressContact },
            { icon: 'ios-log-out', text: 'Sign out', onPress: this.props.onPressSignOut, onlyMember: true }
        ];

        return (
            <ScrollableTabView
                renderTabBar={() => <CustomTabBar />}
                onChangeTab={(i, ref) => {
                    firebase.analytics().logEvent(`Page_${tabs[i]}`, {});
                }}
            >
                <HomeTab
                    tabLabel="ios-home"
                    refreshing={this.props.refreshing}
                    refresh={this.refreshHome.bind(this)}
                    recentSongs={this.props.recentSongs}
                    recentAlbums={this.props.recentAlbums}
                    topAlbums={this.props.topAlbums}
                    anniversaryEvents={this.props.anniversaryEvents}
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
                    artists={this.props.followedArtists}
                    onPressSong={this.props.onPressSong}
                    onPressArtist={this.props.onPressArtist}
                    onPressMore={this.props.onPressArtistRecentSongs} />
                <MenuTab
                    tabLabel="ios-menu"
                    menus={menus} />
            </ScrollableTabView>
        )
    }
}

export default Main;