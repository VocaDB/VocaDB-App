import { normalize } from 'normalizr'
import schemas from './../../schema'
import { createAction } from 'redux-act'

export const getAlbum = createAction(id => ({ id }))
export const getAlbumSuccess = createAction(data => normalize(data, schemas['albums']))
