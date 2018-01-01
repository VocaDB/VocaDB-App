import * as types from './song.action.type'
import { createAction } from 'redux-act'

export const getSong = createAction(types.GET, id => ({ id }))
export const getSongSuccess = createAction(types.GET_SUCCESS, song => ({ song }))
export const getSongError = createAction(types.GET_ERROR)
