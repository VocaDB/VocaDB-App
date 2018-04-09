import { createReducer } from 'redux-act'
import * as actions from './tagActions';
import _ from 'lodash'

export const defaultState = {
    detail: 0,
    topSongs: [],
    topArtists: [],
    topAlbums: [],
    latestSongsByTagId: {},
    searchResult: []
}

const reducer = createReducer({
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
