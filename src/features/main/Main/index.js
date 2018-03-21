import React from 'react'
import { connect } from 'react-redux'
import Main from './Main'
import { createSelector } from 'reselect';
import Icon from '../../../components/Icon/index'
import Routes from './../../../app/appRoutes'
import { selectHighlighted, selectFollowedSongs } from '../../song/songSelector'
import { selectLatestAlbums, selectTopAlbums } from '../../album/albumSelector'
import { selectLatestReleaseEvents } from '../../releaseEvent/releaseEventSelector'
import { selectLoading } from '../../../app/appSelector'
import * as songActions from '../../song/songActions'
import * as albumActions from '../../album/albumActions'
import * as eventActions from '../../releaseEvent/releaseEventActions'


Main.navigationOptions = ({ navigation }) => ({
    title: 'VocaDB',
    drawerLabel: 'VocaDB',
    headerRight: (
        <Icon name='ios-search' color='white' onPress={() => navigation.navigate('Search')} />
    ),
})

Main.propTypes = {

}

const mapStateSelector = createSelector(
    selectHighlighted(),
    selectLoading(),
    selectLatestReleaseEvents(),
    selectLatestAlbums(),
    selectTopAlbums(),
    selectFollowedSongs(),
    (recentSongs, refreshing, latestEvents, recentAlbums, topAlbums, followedSongs) => ({
        recentSongs,
        refreshing,
        latestEvents,
        recentAlbums,
        topAlbums,
        followedSongs
    })
);

const mapDispatchToProps = (dispatch, props) => ({
    fetchHighlighted: () => dispatch(songActions.fetchHighlighted()),
    fetchTopAlbums: () => dispatch(albumActions.fetchTopAlbums()),
    fetchRecentSongs: () => dispatch(songActions.fetchLatestSongs()),
    fetchLatestEvents: () => dispatch(eventActions.fetchLatestReleaseEvents()),
    fetchRecentAlbums: () => dispatch(albumActions.fetchLatestAlbums()),
    fetchFollowedSongs: () => dispatch(songActions.fetchFollowedSongs()),
    onPressSongSearch: () => props.navigation.navigate(Routes.SongList, { searchable: true, hideHeader: true }),
    onPressArtistSearch: () => props.navigation.navigate(Routes.ArtistList, { searchable: true, hideHeader: true }),
    onPressAlbumSearch: () =>  props.navigation.navigate(Routes.AlbumSearch, { searchable: true, hideHeader: true }),
    onPressEventSearch: () =>  props.navigation.navigate(Routes.EventSearch, { hideHeader: true }),
    onPressSong: song => props.navigation.navigate(Routes.SongDetail, { id: song.id }),
    onPressAlbum: album => props.navigation.navigate(Routes.AlbumDetail, { id: album.id }),
    onPressEvent: event => props.navigation.navigate(Routes.EventDetail, { id: event.id, title: event.name }),
    onPressMoreRecentSongs: () => props.navigation.navigate(Routes.SongWithParams, {
        title: 'Recent songs',
        filterParams: {
            'maxResults': 20,
            'sort': 'AdditionDate',
            'fields': 'thumbUrl'
        }
    }),
    onPressMenuFollowArtists: () => props.navigation.navigate(Routes.FollowedArtists)
})

export default connect(mapStateSelector, mapDispatchToProps)(Main)