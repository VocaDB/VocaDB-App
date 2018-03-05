import { createAction } from 'redux-act'
import { normalize } from 'normalizr'
import schemas from './../../schema'

export const fetchLatestSongs = createAction('fetch latest songs', () => ({ loading: true }))
export const fetchLatestSongsSuccess =  createAction('fetch latest songs success', data => normalize(data, [ schemas['songs'] ]))

export const fetchFollowedSongs = createAction('fetch followed songs', (artistId) => ({ loading: true }))
export const fetchFollowedSongsSuccess =  createAction('fetch followed songs success', data => normalize(data, [ schemas['songs'] ]))

export const fetchSongDetail = createAction(id => ({ loading: true, id }))
export const fetchSongDetailSuccess = createAction(data => normalize(data, schemas['songs']))