import * as types from './artist.action.type'
import { createAction } from 'redux-act'

export const getArtist = createAction(types.GET, id => ({ id }))
export const getArtistSuccess = createAction(types.GET_SUCCESS, artist => ({ artist }))
export const getArtistError = createAction(types.GET_ERROR)
