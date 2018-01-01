import { createReducer } from 'redux-act'
import {getSong, getSongError, getSongSuccess} from "./song.action";

const defaultState = {
    loading: false,
    song: {}
}

const reducer = createReducer({
    [getSong]: (state) => ({ ...state, loading: true }),
    [getSongSuccess]: (state, payload) => ({ ...state, loading: false, song: payload.song }),
    [getSongError]: (state, error) => ({ ...state, error, loading: false })
}, defaultState)

export default reducer
