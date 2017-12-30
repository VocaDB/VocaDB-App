import { createAction } from 'redux-act'
import * as types from './login.action.type'
import { ROOT } from './../../constants/routes'

export const usernameChange = createAction(types.USERNAME_CHANGE, (username) => ({ username }))
export const passwordChange = createAction(types.PASSWORD_CHANGE, (password) => ({ password }))
export const login = createAction(types.LOG_IN, (username, password) => ({ username, password }))
export const loginSuccess = createAction(types.LOG_IN_SUCCESS, (profile) => ({ profile, routeName: ROOT }))
export const loginError = createAction(types.LOG_IN_ERROR)


