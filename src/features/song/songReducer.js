import { createReducer } from 'redux-act'
import * as actions from './songActions';
import merge from 'deepmerge';
import _ from 'lodash'

export const defaultState = {
    searchResult: [],
    searchParams: { nameMatchMode: 'auto', maxResults: 50, fields: 'thumbUrl', songTypes: '', artistId: [], tagId: [] },
    noResult: false,
    all: [],
    followed: [],
    detail: 0
}

const reducer = createReducer({
    [actions.fetchSearchSongs]: (state, payload) => {

        let searchParams = merge({}, state.searchParams)

        if(payload.remove) {
            _.forEach(payload.params, (value, key) => {
                searchParams[key] = _.pullAll(state.searchParams[key], value)
            })
        } else {
            searchParams = merge(state.searchParams, payload.params)
        }

        return { ...state, searchParams }

    },
    [actions.fetchSearchSongsSuccess]: (state, payload) => {

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
    [actions.fetchLatestSongsSuccess]: (state, payload) => {
        return { ...state, all: payload.result }
    },
    [actions.fetchFollowedSongsSuccess]: (state, payload) => {
        return { ...state, followed: payload.result }
    },
    [actions.fetchSongDetailSuccess]: (state, payload) => {
        return { ...state, detail: payload.result }
    }
}, defaultState)

export default reducer
