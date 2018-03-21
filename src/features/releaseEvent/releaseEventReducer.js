import { createReducer } from 'redux-act'
import * as actions from './releaseEventActions';
import merge from "lodash/merge"
import _ from 'lodash'

export const defaultSearchParams = { maxResults: 50, fields: 'MainPicture', sort: 'Date' }

export const defaultState = {
    all: [],
    detail: 0,
    searchResult: [],
    searchParams: defaultSearchParams,
    noResult: false
}

const reducer = createReducer({
    [actions.fetchSearchEvents]: (state, payload) => {

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
    [actions.fetchSearchEventsSuccess]: (state, payload) => {

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
    [actions.fetchLatestReleaseEventsSuccess]: (state, payload) => {
        return { ...state, all: payload.result }
    },
    [actions.fetchReleaseEventDetailSuccess]: (state, payload) => {
        return { ...state, detail: payload.result }
    }
}, defaultState)

export default reducer
