import { createSelector } from 'reselect';
import { selectNav } from './../../app/appSelector'
import Routes from './../../app/appRoutes'
import { selectArtistEntity } from './../artist/artistSelector'
import image from './../../common/assets/images'

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
export const selectSearchParams = () => createSelector(
    selectAlbum(),
    album => album.searchParams
)
export const selectSearchResultIds = () => createSelector(
    selectAlbum(),
    album => album.searchResult
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
export const selectSearchResult = () => createSelector(
    selectSearchResultIds(),
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


