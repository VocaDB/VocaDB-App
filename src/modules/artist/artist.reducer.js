import { createReducer } from 'redux-act'

const defaultState = {
    loading: false,
    artist: {}
}

const reducer = createReducer({
}, defaultState)

export default reducer
