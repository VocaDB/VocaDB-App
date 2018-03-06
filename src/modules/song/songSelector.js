import { createSelector } from 'reselect';
import { denormalize } from 'normalizr';
import songSchema from './songSchema'

export const convertSongIds = (songIds, songEntity) => songIds
    .filter(id => (id != undefined && songEntity[id.toString()]))
    .map(id => songEntity[id.toString()])


export const selectSong = () => state => state.song
export const selectSongEntity = () => state => (state.entities && state.entities.songs)? state.entities.songs : {}
export const selectEntities = () => state => state.entities
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
    selectSong(),
    song => song.detail
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

