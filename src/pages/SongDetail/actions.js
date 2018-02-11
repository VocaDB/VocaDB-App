import { normalize } from 'normalizr'
import schemas from './../../schema'
import { createAction } from 'redux-act'

export const getSong = createAction(id => ({ id }))
export const getSongSuccess = createAction(data => normalize(data, schemas['songs']))
