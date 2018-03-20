import React from 'react'
import { connect } from 'react-redux'
import Main from './Main'
import { createSelector } from 'reselect';
import Icon from '../../../components/Icon/index'
import { Page } from '../../../AppNavigator'
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
    onPressSongSearch: () => props.navigation.navigate(Page.SongList, { searchable: true, hideHeader: true }),
    onPressArtistSearch: () => props.navigation.navigate(Page.ArtistList, { searchable: true, hideHeader: true }),
    onPressAlbumSearch: () =>  props.navigation.navigate(Page.AlbumSearch, { searchable: true, hideHeader: true }),
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

export default connect(mapStateSelector, mapDispatchToProps)(Main)