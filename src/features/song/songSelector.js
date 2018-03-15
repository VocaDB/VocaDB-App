import { createSelector } from 'reselect';
import { denormalize } from 'normalizr';
import songSchema from './songSchema'
import { selectNav } from './../../app/appSelector'
import { Page } from './../../AppNavigator'

export const convertSongIds = (songIds, songEntity) => (songIds)? songIds
    .filter(id => (id != undefined && songEntity[id.toString()]))
    .map(id => songEntity[id.toString()]) : []


export const selectSong = () => state => state.song
export const selectSongEntity = () => state => (state.entities && state.entities.songs)? state.entities.songs : {}
export const selectEntities = () => state => state.entities
export const selectNoResult = () => createSelector(
    selectSong(),
    song => song.noResult
)
export const selectSearchParams = () => createSelector(
    selectSong(),
    song => song.searchParams
)
export const selectSearchResultIds = () => createSelector(
    selectSong(),
    song => song.searchResult
)
export const selectLatestSongIds = () => createSelector(
    selectSong(),
    song => song.all
)
export const selectFollowedSongIds = () => createSelector(
    selectSong(),
    song => song.followed
)
export const selectSongDetailId = () => createSelector(
    selectNav(),
    nav => (nav
        && nav.routes[nav.index]
        && nav.routes[nav.index].routeName === Page.SongDetail)? nav.routes[nav.index].params.id : 0
)

export const selectSearchResult = () => createSelector(
    selectSearchResultIds(),
    selectSongEntity(),
    convertSongIds
)

export const selectLatestSongs = () => createSelector(
    selectLatestSongIds(),
    selectSongEntity(),
    convertSongIds
)

export const selectFollowedSongs = () => createSelector(
    selectFollowedSongIds(),
    selectSongEntity(),
    convertSongIds
);

export const selectSongDetail = () => createSelector(
    selectSongDetailId(),
    selectSongEntity(),
    (songDetailId, songEntity) => {
        return songEntity[songDetailId.toString()]
    }
)

