import { createSelector } from 'reselect';
import { selectNav } from './../../app/appSelector'
import Routes from './../../app/appRoutes'
import { selectArtistEntity } from './../artist/artistSelector'
import image from './../../common/assets/images'
import { selectTagEntity, convertTagIds } from './../tag/tagSelector'
import { defaultSearchParams } from './albumConstant'

export const convertAlbum = (entry) => {
    if(!entry) {
        return {}
    }

    return {
        ...entry,
        image: (entry.mainPicture && entry.mainPicture.urlThumb) ? entry.mainPicture.urlThumb : image.getAlbumUri(entry.id, entry.coverPictureMime)
    }
}

export const convertAlbumIds = (entryIds, entryEntity) => (entryIds) ? entryIds
    .filter(id => (id != undefined && entryEntity[id.toString()]))
    .map(id => entryEntity[id.toString()])
    .map(convertAlbum): []

export const selectAlbum = () => state => state.album
export const selectAlbumEntity = () => state => (state.entities && state.entities.albums)? state.entities.albums : {}
export const selectNoResult = () => createSelector(
    selectAlbum(),
    album => album.noResult
)
export const selectLatestAlbumIds = () => createSelector(
    selectAlbum(),
    album => album.all
)
export const selectTopAlbumIds = () => createSelector(
    selectAlbum(),
    album => album.top
)
export const selectAlbumDetailId = () => createSelector(
    selectNav(),
    nav => (nav
        && nav.routes[nav.index]
        && nav.routes[nav.index].routeName === Routes.AlbumDetail)? nav.routes[nav.index].params.id : 0
)

export const selectLatestAlbums = () => createSelector(
    selectLatestAlbumIds(),
    selectAlbumEntity(),
    convertAlbumIds
)

export const selectTopAlbums = () => createSelector(
    selectTopAlbumIds(),
    selectAlbumEntity(),
    convertAlbumIds
)

export const selectAlbumDetail = () => createSelector(
    selectAlbumDetailId(),
    selectAlbumEntity(),
    (albumDetailId, albumEntity) => convertAlbum(albumEntity[albumDetailId.toString()])
)

export const selectFilterArtists = () => createSelector(
    selectSearchParams(),
    selectArtistEntity(),
    (searchParams, artistEntity) => {
        if(!searchParams || !searchParams.artistId || !artistEntity) {
            return []
        }

        return searchParams.artistId.map(id => artistEntity[id.toString()])
    }
)

export const selectFavoriteAlbumIds = () => createSelector(
    selectAlbum(),
    albumState => (albumState.favoriteAlbums)? albumState.favoriteAlbums : []
)

export const selectFavoriteAlbums = () => createSelector(
    selectFavoriteAlbumIds(),
    selectAlbumEntity(),
    convertAlbumIds
)

export const selectIsFavoriteAlbum = () => createSelector(
    selectAlbum(),
    selectFavoriteAlbumIds(),
    selectAlbumDetailId(),
    (albumState, favoriteAlbumIds, albumDetailId) => {
        return (favoriteAlbumIds && favoriteAlbumIds.indexOf(albumDetailId) >=0)? true : false
    }
)


export const selectSearchParams = () => createSelector(
    selectAlbum(),
    state => {

        if(!state || !state.searchPage || !state.searchPage.params) {
            return defaultSearchParams
        }

        const searchParams = state.searchPage.params;

        searchParams.sort = (searchParams.sort)? searchParams.sort : 'Name'
        searchParams.query = (searchParams.query)? searchParams.query : ''

        return searchParams;
    }
)

export const selectSearchResultIds = () => createSelector(
    selectAlbum(),
    state => (state && state.searchPage && state.searchPage.results)? state.searchPage.results : []
)

export const selectSearchResult = () => createSelector(
    selectSearchResultIds(),
    selectAlbumEntity(),
    convertAlbumIds
)


export const selectFilterTagIds = () => createSelector(
    selectSearchParams(),
    (searchParams) => {
        return (searchParams && searchParams.tagId)? searchParams.tagId : []
    }
)

export const selectFilterTags = () => createSelector(
    selectSearchParams(),
    selectTagEntity(),
    (params, tagEntity) => {
        return convertTagIds(params.tagId, tagEntity)
    }
)

export const selectSelectedSinglePage = () => createSelector(
    selectAlbum(),
    selectNav(),
    (albumState, nav) => {

        if(!albumState || !albumState.singlePage || !nav || !nav.routes[nav.index]) {
            return { params: {}, results: [] }
        }

        let selectedRoute = nav.routes[nav.index]
        let selectedSinglePage = albumState.singlePage[selectedRoute.key]

        if(!selectedSinglePage) {
            return { params: {}, results: [] }
        }

        return selectedSinglePage
    }
)

export const selectSelectedSinglePageParams = () => createSelector(
    selectSelectedSinglePage(),
    (selectedSinglePage) => (selectedSinglePage && selectedSinglePage.params)? selectedSinglePage.params : {}
)

export const selectSelectedSinglePageResults = () => createSelector(
    selectSelectedSinglePage(),
    selectAlbumEntity(),
    (selectedSinglePage, entity) => {
        return (selectedSinglePage && selectedSinglePage.results)? convertAlbumIds(selectedSinglePage.results, entity) : []
    }
)

export const selectSelectedNavRoute = () => createSelector(
    selectNav(),
    (nav) => (nav.routes[nav.index])? nav.routes[nav.index] : {}
)