import React from 'react'
import { connect } from 'react-redux'
import MainTab from './MainTab'
import { createSelector } from 'reselect';
import Icon from '../../../components/Icon/index'
import { Page } from '../../../AppNavigator'
import { selectLatestSongs, selectFollowedSongs } from '../../song/songSelector'
import { selectLatestAlbums } from '../../album/albumSelector'
import { selectLatestReleaseEvents } from '../../releaseEvent/releaseEventSelector'
import { selectLoading } from '../../../app/appSelector'
import * as songActions from '../../song/songActions'
import * as albumActions from '../../album/albumActions'
import * as eventActions from '../../releaseEvent/releaseEventActions'


MainTab.navigationOptions = ({ navigation }) => ({
    title: 'VocaDB',
    drawerLabel: 'VocaDB',
    headerRight: (
        <Icon name='ios-search' color='white' onPress={() => navigation.navigate('Search')} />
    ),
})

MainTab.propTypes = {

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
    onPressArtistSearch: () => props.navigation.navigate(Page.ArtistList, { searchable: true, hideHeader: true }),
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

export default connect(homeStateSelect, mapDispatchToProps)(MainTab)