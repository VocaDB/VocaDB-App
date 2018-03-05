import { createSelector } from 'reselect';

export const selectSong = () => state => state.song
export const selectSongEntity = () => state => (state.entities && state.entities.songs)? state.entities.songs : {}
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

export const selectLatestSongs = () => createSelector(
    selectLatestSongIds(),
    selectSongEntity(),
    (songIds, songEntity) => songIds
        .filter(id => (id != undefined && songEntity[id.toString()]))
        .map(id => songEntity[id.toString()])
)

export const selectFollowedSongs = () => createSelector(
    selectFollowedSongIds(),
    selectSongEntity(),
    (followedSongIds, songEntity) => followedSongIds
        .filter(id => (id != undefined && songEntity[id.toString()]))
        .map(id => songEntity[id.toString()])
);

export const selectSongDetail = () => createSelector(
    selectSongDetailId(),
    selectSongEntity(),
    (songDetailId, songEntity) => songEntity[songDetailId.toString()]
)