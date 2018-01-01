import * as types from './album.action.type'
import { createAction } from 'redux-act'

export const getAlbum = createAction(types.GET, id => ({ id }))
export const getAlbumSuccess = createAction(types.GET_SUCCESS, album => ({ album }))
export const getAlbumError = createAction(types.GET_ERROR)
