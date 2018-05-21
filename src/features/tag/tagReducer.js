import { createReducer } from 'redux-act'
import * as actions from './tagActions';
import merge from 'deepmerge';
import _ from 'lodash'

export const defaultState = {
    detail: 0,
    topSongs: [],
    topArtists: [],
    topAlbums: [],
    latestSongsByTagId: {},
    searchParams: {},
    searchResult: []
}

const reducer = createReducer({
    [actions.searchTags]: (state, payload) => {

        if(payload.replace) {
            let searchParams = _.merge({}, payload.params)
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
    [actions.addTagsSearchResult]: (state, payload) => {
        if(!payload || !payload.result) return state;

        return { ...state, searchResult: payload.result }
    },
    [actions.appendTagsSearchResult]: (state, payload) => {
        if(!payload || !payload.result) return state;

        return { ...state, searchResult: _.union(state.searchResult, payload.result) }
    },
    [actions.fetchTagDetailSuccess]: (state, payload) => {
        return { ...state, detail: payload.result }
    },
    [actions.fetchTopSongsByTagSuccess]: (state, payload) => {
        return { ...state, topSongs: payload.result }
    },
    [actions.fetchTopArtistsByTagSuccess]: (state, payload) => {
        return { ...state, topArtists: payload.result }
    },
    [actions.fetchTopAlbumsByTagSuccess]: (state, payload) => {
        return { ...state, topAlbums: payload.result }
    },
    [actions.addLatestSongsByTagId]: (state, payload) => {
        if(!payload.id && !payload.data && !payload.data.result) {
            return state
        }

        const latestSongsByTagId = Object.assign({}, state.latestSongsByTagId)

        latestSongsByTagId[payload.id.toString()] = payload.data.result

        return { ...state, latestSongsByTagId }
    },
    [actions.clearSearch]: (state) => {
        return { ...state, searchResult: [] }
    }
}, defaultState)

export default reducer
