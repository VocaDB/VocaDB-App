import { createReducer } from 'redux-act'
import * as actions from './releaseEventActions';

export const defaultState = {
    all: [],
    detail: 0
}

const reducer = createReducer({
    [actions.fetchLatestReleaseEventsSuccess]: (state, payload) => {
        return { ...state, all: payload.result }
    },
    [actions.fetchReleaseEventDetailSuccess]: (state, payload) => {
        return { ...state, detail: payload.result }
    }
}, defaultState)

export default reducer
