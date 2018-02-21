import { normalize } from 'normalizr'
import schemas from './../../schema'
import { createAction } from 'redux-act'

export const getSongs = createAction('Get songs', params => ({ params }))
export const getSongsSuccess = createAction('Get songs success', data => normalize(data, [ schemas['songs'] ]))