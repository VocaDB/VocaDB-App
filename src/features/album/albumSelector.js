import { createSelector } from 'reselect';
import { selectNav } from './../../app/appSelector'
import { Page } from './../../AppNavigator'

export const selectAlbum = () => state => state.album
export const selectAlbumEntity = () => state => (state.entities && state.entities.albums)? state.entities.albums : {}
export const selectLatestAlbumIds = () => createSelector(
    selectAlbum(),
    album => album.all
)
export const selectAlbumDetailId = () => createSelector(
    selectNav(),
    nav => (nav
        && nav.routes[nav.index]
        && nav.routes[nav.index].routeName === Page.AlbumDetail)? nav.routes[nav.index].params.id : 0
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