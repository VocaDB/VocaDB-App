import * as types from './storage.action.type'
import { createAction } from 'redux-act'

export const save = createAction(types.SAVE, (key, value) => ({ key, value }))
export const saveSuccess = createAction(types.SAVE_SUCCESS, (key, value) => ({ key, value }))
export const get = createAction(types.GET, (key) => ({ key }))
export const getSuccess = createAction(types.GET_SUCCESS, (value) => ({ value }))
export const error = createAction(types.ERROR)