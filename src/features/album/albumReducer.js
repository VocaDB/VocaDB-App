import { createReducer } from 'redux-act'
import * as actions from './albumActions';
import merge from 'deepmerge';
import _ from 'lodash'

export const defaultSearchParams = {
    maxResults: 30,
    nameMatchMode: 'auto',
    fields: 'MainPicture',
    sort: 'ReleaseDate'
}

export const defaultState = {
    all: [],
    top: [],
    detail: 0,
    searchResult: [],
    favoriteAlbums: [],
    searchParams: defaultSearchParams,
    noResult: false
}

const reducer = createReducer({
    [actions.fetchSearchAlbums]: (state, payload) => {

        if(payload.replace) {
            let searchParams = _.merge({}, defaultSearchParams, payload.params)
            return { ...state, searchParams }
        }

        let searchParams = merge({}, state.searchParams)
        if(payload.remove) {
            _.forEach(payload.params, (value, key) => {
                searchParams[key] = _.pullAll(state.searchParams[key], value)
            })
        } else {
            searchParams = merge(state.searchParams, payload.params, {
                arrayMerge: (destinationArray, sourceArray) => {
                    return _.union(destinationArray, sourceArray)
                }
            })
        }

        return { ...state, searchParams }

    },
    [actions.fetchSearchAlbumsSuccess]: (state, payload) => {

        if(payload.result.length === 0) {
            return { ...state, noResult: true }
        }

        if(payload.append) {
            let newSearchResult = state.searchResult;
            newSearchResult = newSearchResult.concat(payload.result);

            return { ...state, searchResult: newSearchResult, noResult: false }
        }
        return { ...state, searchResult: payload.result, noResult: false }
    },
    [actions.fetchLatestAlbumsSuccess]: (state, payload) => {
        return { ...state, all: payload.result }
    },
    [actions.fetchTopAlbumsSuccess]: (state, payload) => {
        return { ...state, top: payload.result }
    },
    [actions.fetchAlbumDetailSuccess]: (state, payload) => {
        return { ...state, detail: payload.result }
    },
    [actions.addFavoriteAlbum]: (state, payload) => {
        const album = payload.album;

        if(!album) {
            return state
        }

        let currentFavoriteAlbums = (state.favoriteAlbums)? state.favoriteAlbums : []

        if(currentFavoriteAlbums.indexOf(album.id) >= 0) {
            return state
        }

        currentFavoriteAlbums.unshift(album.id)

        return { ...state, favoriteAlbums: currentFavoriteAlbums }
    },
    [actions.removeFavoriteAlbum]: (state, payload) => {
        const album = payload.album;

        if(!album) {
            return state
        }

        let currentFavoriteAlbums = state.favoriteAlbums.filter(id => id != album.id)

        return { ...state, favoriteAlbums: currentFavoriteAlbums }
    }
}, defaultState)

export default reducer
