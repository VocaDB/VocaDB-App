import { createSelector } from 'reselect';
import { selectNav } from './../../app/appSelector'
import { selectSongEntity } from './../song/songSelector'
import { selectArtistEntity } from './../artist/artistSelector'
import { selectAlbumEntity } from "../album/albumSelector"
import { convertSongIds } from './../song/songSelector'
import { convertArtistIds } from './../artist/artistSelector'
import { convertAlbumIds } from './../album/albumSelector'
import Routes from './../../app/appRoutes'

export const selectTag = () => state => state.tag
export const selectTagEntity = () => state => (state.entities && state.entities.tags)? state.entities.tags : {}
export const selectTagDetailId = () => createSelector(
    selectNav(),
    nav => (nav
        && nav.routes[nav.index]
        && nav.routes[nav.index].routeName === Routes.TagDetail)? nav.routes[nav.index].params.id : 0
)
export const selectTopSongIds = () => createSelector(
    selectTag(),
    tag => (tag)? tag.topSongs : []
)
export const selectTopArtistIds = () => createSelector(
    selectTag(),
    tag => (tag)? tag.topArtists : []
)
export const selectTopAlbumIds = () => createSelector(
    selectTag(),
    tag => (tag)? tag.topAlbums : []
)


export const selectTagDetail = () => createSelector(
    selectTagDetailId(),
    selectTagEntity(),
    (tagDetailId, tagEntity) => tagEntity[tagDetailId.toString()]
)

export const selectTopSongs = () => createSelector(
    selectTopSongIds(),
    selectSongEntity(),
    convertSongIds
)

export const selectTopArtists = () => createSelector(
    selectTopArtistIds(),
    selectArtistEntity(),
    convertArtistIds
)

export const selectTopAlbums = () => createSelector(
    selectTopAlbumIds(),
    selectAlbumEntity(),
    convertAlbumIds
)

export const selectTagDetailLatestSongs = () => createSelector(
    selectTag(),
    selectSongEntity(),
    (tagState, songEntity) => {
        if(!tagState
            || !tagState.detail
            || !tagState.latestSongsByTagId
            || !tagState.latestSongsByTagId[tagState.detail.toString()]
            || !songEntity) {
            return [];
        }
        return convertSongIds(tagState.latestSongsByTagId[tagState.detail.toString()], songEntity);
    }
)