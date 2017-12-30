import { signOut } from './profile.action'
import { createReducer } from 'redux-act'

const defaultState = {
}

const reducer = createReducer({
    [signOut]: (state) => (state) => ({ ...state })
}, defaultState)

export default reducer
