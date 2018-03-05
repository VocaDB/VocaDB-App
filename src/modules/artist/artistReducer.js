import { createReducer } from 'redux-act'
import * as actions from './artistActions';

export const defaultState = {
    detail: 0
}

const reducer = createReducer({
    [actions.fetchArtistDetailSuccess]: (state, payload) => {
        return { ...state, detail: payload.result }
    }
}, defaultState)

export default reducer
