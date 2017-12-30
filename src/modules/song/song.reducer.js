import { createReducer } from 'redux-act'

const defaultState = {
    loading: false,
    song: {}
}

const reducer = createReducer({
}, defaultState)

export default reducer
