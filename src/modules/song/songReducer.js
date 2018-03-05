import { createReducer } from 'redux-act'
import * as actions from './songActions';

export const defaultState = {
    all: [],
    followed: [],
    detail: 0
}

const reducer = createReducer({
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
