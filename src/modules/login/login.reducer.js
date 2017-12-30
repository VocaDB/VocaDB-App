import { login, logInSuccess, logInError, usernameChange, passwordChange } from './login.action'
import { createReducer } from 'redux-act'

const defaultState = {
    loading: false,
    username: '',
    password: ''
}

const reducer = createReducer({
    [usernameChange]: (state, payload) => ({ ...state, username: payload.username}),
    [passwordChange]: (state, payload) => ({ ...state, password: payload.password}),
    [login]: (state) => ({ ...state, loading: true }),
    [logInSuccess]: (state, payload) => ({ ...state, loading: false }),
    [logInError]: (state, error) => ({ ...state, loading: false, error })
}, defaultState)

export default reducer
