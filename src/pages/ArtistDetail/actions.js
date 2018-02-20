import { normalize } from 'normalizr'
import schemas from './../../schema'
import { createAction } from 'redux-act'

export const getArtist = createAction(id => ({ id }))
export const getArtistSuccess = createAction(data => normalize(data, schemas['artists']))
