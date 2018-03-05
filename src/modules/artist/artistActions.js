import { createAction } from 'redux-act'
import { normalize } from 'normalizr'
import schemas from './../../schema'

export const fetchArtistDetail = createAction(id => ({ loading: true, id }))
export const fetchArtistDetailSuccess = createAction(data => normalize(data, schemas['artists']))
