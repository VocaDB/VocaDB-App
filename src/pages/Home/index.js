import React from 'react'
import { connect } from 'react-redux'
import HomePage from './component'
import { createSelector } from 'reselect';
import Icon from './../../components/Icon'
import { Page } from './../../AppNavigator'
import { selectLatestSongs, selectFollowedSongs } from '../../features/song/songSelector'
import { selectLatestAlbums } from '../../features/album/albumSelector'
import { selectLatestReleaseEvents } from '../../features/releaseEvent/releaseEventSelector'
import { selectLoading } from './../../app/appSelector'
import * as songActions from '../../features/song/songActions'
import * as albumActions from '../../features/album/albumActions'
import * as eventActions from '../../features/releaseEvent/releaseEventActions'


HomePage.navigationOptions = ({ navigation }) => ({
    title: 'Home',
    drawerLabel: 'Home',
    headerRight: (
        <Icon name='ios-search' color='white' onPress={() => navigation.navigate('Search')} />
    ),
})

HomePage.propTypes = {

}

const homeStateSelect = createSelector(
    selectLatestSongs(),
    selectLoading(),
    selectLatestReleaseEvents(),
    selectLatestAlbums(),
    selectFollowedSongs(),
    (recentSongs, refreshing, latestEvents, recentAlbums, followedSongs) => ({
        recentSongs,
        refreshing,
        latestEvents,
        recentAlbums,
        followedSongs
    })
);

const mapDispatchToProps = (dispatch, props) => ({
    fetchRecentSongs: () => dispatch(songActions.fetchLatestSongs()),
    fetchLatestEvents: () => dispatch(eventActions.fetchLatestReleaseEvents()),
    fetchRecentAlbums: () => dispatch(albumActions.fetchLatestAlbums()),
    fetchFollowedSongs: () => dispatch(songActions.fetchFollowedSongs()),
    onPressSongSearch: () => props.navigation.navigate(Page.SongList, { searchable: true, hideHeader: true }),
    onPressSong: song => props.navigation.navigate(Page.SongDetail, { id: song.id }),
    onPressAlbum: album => props.navigation.navigate(Page.AlbumDetail, { id: album.id }),
    onPressEvent: event => props.navigation.navigate(Page.EventDetail, { id: event.id, title: event.name }),
    onPressMoreRecentSongs: () => props.navigation.navigate(Page.SongList, {
        title: 'Recent songs',
        params: {
            'maxResults': 20,
            'sort': 'AdditionDate',
            'fields': 'thumbUrl'
        }
    }),
    onPressMenuFollowArtists: () => props.navigation.navigate(Page.FollowedArtists)
})

export default connect(homeStateSelect, mapDispatchToProps)(HomePage)