import { createReducer } from 'redux-act'
import * as actions from './albumActions';

export const defaultState = {
    all: [],
    detail: 0
}

const reducer = createReducer({
    [actions.fetchLatestAlbumsSuccess]: (state, payload) => {
        return { ...state, all: payload.result }
    },
    [actions.fetchAlbumDetailSuccess]: (state, payload) => {
        return { ...state, detail: payload.result }
    }
}, defaultState)

export default reducer
