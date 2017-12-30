import * as types from './profile.action.type'
import * as routes from './../../constants/routes'
import { createAction } from 'redux-act'

export const signIn = createAction(types.SIGN_IN, () => ({ routeName: routes.LOGIN }))
export const signOut = createAction(types.SIGN_OUT, () => ({ loading: true }))

