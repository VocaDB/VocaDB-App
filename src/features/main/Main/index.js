import React from 'react';
import { connect } from 'react-redux';
import Main from './Main';
import { createSelector } from 'reselect';
import Icon from '../../../components/Icon/index';
import Routes from './../../../app/appRoutes';
import { selectHighlighted, selectFollowedSongs, selectRankingResult, selectRankingState, selectFavoriteSongs } from '../../song/songSelector';
import { selectFollowedArtistsWithLatestSongs } from '../../artist/artistSelector';
import { selectLatestAlbums, selectTopAlbums } from '../../album/albumSelector';
import { selectLatestReleaseEvents, selectRunningAnniversaryEvents } from '../../releaseEvent/releaseEventSelector';
import { selectLoading } from '../../../app/appSelector';
import * as userActions from '../../user/userActions';
import * as songActions from '../../song/songActions';
import * as albumActions from '../../album/albumActions';
import * as eventActions from '../../releaseEvent/releaseEventActions';


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
    selectRankingState(),
    selectRankingResult(),
    selectFollowedArtistsWithLatestSongs(),
    selectRunningAnniversaryEvents(),
    (recentSongs, refreshing, latestEvents, recentAlbums, topAlbums, followedSongs, rankingState, rankingSongs, followedArtists, anniversaryEvents) => ({
        recentSongs,
        refreshing,
        latestEvents,
        recentAlbums,
        topAlbums,
        followedSongs,
        rankingState,
        rankingSongs,
        followedArtists,
        anniversaryEvents
    })
);

const mapDispatchToProps = (dispatch, props) => ({
    fetchHighlighted: () => dispatch(songActions.fetchHighlighted()),
    fetchTopAlbums: () => dispatch(albumActions.fetchTopAlbums()),
    fetchRecentSongs: () => dispatch(songActions.fetchLatestSongs()),
    fetchLatestEvents: () => dispatch(eventActions.fetchLatestReleaseEvents()),
    fetchRunningEventSongs: () => dispatch(eventActions.fetchRunningEventSongs()),
    fetchRecentAlbums: () => dispatch(albumActions.fetchLatestAlbums()),
    fetchFollowedSongs: () => dispatch(songActions.fetchFollowedSongs()),
    clearSinglePageState: () => {
        dispatch(songActions.clearSinglePageState())
        dispatch(albumActions.clearSinglePageState())
    },
    onPressSongSearchShortcut: () => props.navigation.navigate(Routes.SongSearch, { isSearchActive: true, searchable: true, hideHeader: true }),
    onPressArtistSearchShortcut: () => props.navigation.navigate(Routes.ArtistSearch, { isSearchActive: true, searchable: true, hideHeader: true }),
    onPressAlbumSearchShortcut: () => props.navigation.navigate(Routes.AlbumSearch, { isSearchActive: true, searchable: true, hideHeader: true }),
    onPressSongSearch: () => props.navigation.navigate(Routes.SongSearch, { searchable: true, hideHeader: true }),
    onPressArtistSearch: () => props.navigation.navigate(Routes.ArtistSearch, { searchable: true, hideHeader: true }),
    onPressAlbumSearch: () =>  props.navigation.navigate(Routes.AlbumSearch, { searchable: true, hideHeader: true }),
    onPressEventSearch: () =>  props.navigation.navigate(Routes.EventSearch, { hideHeader: true }),
    onPressTagSearch: () =>  props.navigation.navigate(Routes.TagSearch, { hideHeader: true }),
    onPressSong: song => props.navigation.navigate(Routes.SongDetail, { id: song.id, title: song.name }),
    onPressAlbum: album => props.navigation.navigate(Routes.AlbumDetail, { id: album.id, title: album.name }),
    onPressArtist: artist => props.navigation.navigate(Routes.ArtistDetail, { id: artist.id, title: artist.name }),
    onPressEvent: event => props.navigation.navigate(Routes.EventDetail, { id: event.id, title: event.name }),
    onPressArtistRecentSongs: artist => props.navigation.navigate(Routes.SongWithParams, {
        title: artist.name,
        filterParams: {
            onlyWithPVs: true,
            maxResults: 50,
            sort: 'AdditionDate',
            fields: 'thumbUrl',
            artistId: [ artist.id ]
        }
    }),
    onPressMoreRecentSongs: () => props.navigation.navigate(Routes.SongWithParams, {
        title: 'Recent songs',
        filterParams: {
            maxResults: 50,
            onlyWithPVs: true,
            sort: 'AdditionDate',
            fields: 'thumbUrl'
        }
    }),
    onPressMoreRecentAlbums: () => props.navigation.navigate(Routes.AlbumWithParams, {
        title: 'Recent albums',
        filterParams: {
            maxResults: 50,
            sort: 'ReleaseDate',
            fields: 'MainPicture'
        }
    }),
    onPressMoreTopAlbums: () => props.navigation.navigate(Routes.AlbumWithParams, {
        title: 'Popular albums',
        filterParams: {
            maxResults: 50,
            sort: 'RatingTotal',
            fields: 'MainPicture'
        }
    }),
    onPressMenuFollowArtists: () => props.navigation.navigate(Routes.FollowedArtists),
    onPressMenuFavoriteSongs: () => props.navigation.navigate(Routes.FavoriteSongs),
    onPressMenuFavoriteAlbums: () => props.navigation.navigate(Routes.FavoriteAlbums),
    onPressMenuSettings: () => props.navigation.navigate(Routes.Settings),
    onFilterByChanged: value => dispatch(songActions.changeFilterBy(value)),
    onDurationHoursChanged: value => dispatch(songActions.changeDurationHours(value)),
    onVocalistChanged: value => dispatch(songActions.changeVocalist(value)),
    onPressSignOut: () => {
        dispatch(userActions.signOut())
        dispatch(userActions.resetToSignIn())
    },
    onPressExport: () => dispatch(userActions.exportBackupData()),
    onPressImport: () => dispatch(userActions.importBackupData())
 })

export default connect(mapStateSelector, mapDispatchToProps)(Main)