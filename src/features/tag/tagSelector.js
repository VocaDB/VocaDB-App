import { createSelector } from 'reselect';
import { selectSongEntity } from './../song/songSelector'
import { selectArtistEntity } from './../artist/artistSelector'
import { selectAlbumEntity } from "../album/albumSelector"

export const convertSongIds = (songIds, songEntity) => songIds
    .filter(id => (id != undefined && songEntity[id.toString()]))
    .map(id => songEntity[id.toString()])


export const selectTag = () => state => state.tag
export const selectTagEntity = () => state => (state.entities && state.entities.tags)? state.entities.tags : {}
export const selectTagDetailId = () => createSelector(
    selectTag(),
    tag => tag.detail
)
export const selectTopSongIds = () => createSelector(
    selectTag(),
    tag => tag.topSongs
)
export const selectTopArtistIds = () => createSelector(
    selectTag(),
    tag => tag.topArtists
)
export const selectTopAlbumIds = () => createSelector(
    selectTag(),
    tag => tag.topAlbums
)


export const selectTagDetail = () => createSelector(
    selectTagDetailId(),
    selectTagEntity(),
    (tagDetailId, tagEntity) => tagEntity[tagDetailId.toString()]
)

export const selectTopSongs = () => createSelector(
    selectTopSongIds(),
    selectSongEntity(),
    (topSongIds, songEntity) => (!topSongIds || !songEntity)? [] : topSongIds
        .filter(id => (id != undefined && songEntity[id.toString()]))
        .map(id => songEntity[id.toString()])
)

export const selectTopArtists = () => createSelector(
    selectTopArtistIds(),
    selectArtistEntity(),
    (topArtistIds, artistEntity) => (!topArtistIds || !artistEntity)? [] : topArtistIds
        .filter(id => (id != undefined && artistEntity[id.toString()]))
        .map(id => artistEntity[id.toString()])
)

export const selectTopAlbums = () => createSelector(
    selectTopAlbumIds(),
    selectAlbumEntity(),
    (topAlbumIds, albumEntity) => (!topAlbumIds || !albumEntity)? [] : topAlbumIds
        .filter(id => (id != undefined && albumEntity[id.toString()]))
        .map(id => albumEntity[id.toString()])
)