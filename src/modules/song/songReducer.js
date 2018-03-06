import { createReducer } from 'redux-act'
import * as actions from './songActions';

export const defaultState = {
    searchResult: [],
    all: [],
    followed: [],
    detail: 0
}

const reducer = createReducer({
    [actions.fetchSearchSongsSuccess]: (state, payload) => {
        if(payload.append) {
          let newSearchResult = state.searchResult;
          newSearchResult = newSearchResult.concat(payload.result);

          return { ...state, searchResult: newSearchResult }
        }
        return { ...state, searchResult: payload.result }
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
