import { createSelector } from 'reselect';

export const selectAlbum = () => state => state.album
export const selectAlbumEntity = () => state => (state.entities && state.entities.albums)? state.entities.albums : {}
export const selectLatestAlbumIds = () => createSelector(
    selectAlbum(),
    album => album.all
)
export const selectAlbumDetailId = () => createSelector(
    selectAlbum(),
    album => album.detail
)

export const selectLatestAlbums = () => createSelector(
    selectLatestAlbumIds(),
    selectAlbumEntity(),
    (albumIds, albumEntity) => albumIds
        .filter(id => (id != undefined && albumEntity[id.toString()]))
        .map(id => albumEntity[id.toString()])
)

export const selectAlbumDetail = () => createSelector(
    selectAlbumDetailId(),
    selectAlbumEntity(),
    (albumDetailId, albumEntity) => albumEntity[albumDetailId.toString()]
)