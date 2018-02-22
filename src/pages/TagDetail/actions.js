import { normalize } from 'normalizr'
import schemas from './../../schema'
import { createAction } from 'redux-act'

export const getTag = createAction('Get tag', id => ({ id }))
export const getTagSuccess = createAction('Get tag success', data => normalize(data, schemas['tags']))

export const getTopSongs = createAction('Get top songs', tagId => ({ tagId }))
export const getTopSongsSuccess = createAction('Get top songs success', data => normalize(data, [ schemas['songs'] ]))

export const getTopArtists = createAction('Get top artists', tagId => ({ tagId }))
export const getTopArtistsSuccess = createAction('Get top artists success', data => normalize(data, [ schemas['artists'] ]))

export const getTopAlbums = createAction('Get top albums', tagId => ({ tagId }))
export const getTopAlbumsSuccess = createAction('Get top albums success', data => normalize(data, [ schemas['albums'] ]))