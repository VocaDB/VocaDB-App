import { createSelector } from 'reselect';
import { selectNav } from './../../app/appSelector'
import { selectSongEntity } from './../song/songSelector'
import { selectArtistEntity } from './../artist/artistSelector'
import { selectAlbumEntity } from "../album/albumSelector"
import { convertSongIds } from './../song/songSelector'
import { convertArtistIds } from './../artist/artistSelector'
import { convertAlbumIds } from './../album/albumSelector'
import Routes from './../../app/appRoutes'

export const convertTagIds = (tagIds, tagEntity) => (tagIds) ? tagIds
    .filter(id => (id != undefined && tagEntity[id.toString()]))
    .map(id => tagEntity[id.toString()]) : []

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
    selectTagDetail(),
    selectSongEntity(),
    (tagDetail, songEntity) => (tagDetail && tagDetail.topSongs)? convertSongIds(tagDetail.topSongs, songEntity) : []
)

export const selectTopArtists = () => createSelector(
    selectTagDetail(),
    selectArtistEntity(),
    (tagDetail, artistEntity) => (tagDetail && tagDetail.topArtists)? convertArtistIds(tagDetail.topArtists, artistEntity) : []
)

export const selectTopAlbums = () => createSelector(
    selectTagDetail(),
    selectAlbumEntity(),
    (tagDetail, albumEntity) => (tagDetail && tagDetail.topAlbums)? convertAlbumIds(tagDetail.topAlbums, albumEntity) : []
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

export const selectSearchResultIds = () => createSelector(
    selectTag(),
    (tagState) => (tagState.searchResult)? tagState.searchResult : []
)

export const selectSearchResult = () => createSelector(
    selectSearchResultIds(),
    selectTagEntity(),
    convertTagIds
)