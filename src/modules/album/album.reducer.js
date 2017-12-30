import { createReducer } from 'redux-act'

const defaultState = {
    loading: false,
    album: {}
}

const reducer = createReducer({
}, defaultState)

export default reducer
