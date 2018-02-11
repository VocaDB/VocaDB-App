import { normalize } from 'normalizr'
import schemas from './../../schema'
import { createAction } from 'redux-act'

export const getPopularSongs = createAction('Get popular songs')
export const getPopularSongsSuccess = createAction('Get popular songs success', data => normalize(data, [ schemas['songs'] ]))
export const getRecentSongs = createAction('Get recent songs')
export const getRecentSongsSuccess = createAction('Get recent songs success', data => normalize(data, [ schemas['songs'] ]))
