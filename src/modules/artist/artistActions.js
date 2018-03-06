import { createAction } from 'redux-act'
import { normalize } from 'normalizr'
import artistSchema from './artistSchema'

export const fetchArtistDetail = createAction(id => ({ loading: true, id }))
export const fetchArtistDetailSuccess = createAction(data => normalize(data, artistSchema))

export const followArtist = createAction('Follow artist', artist => ({ artist }))
export const unFollowArtist = createAction('UnFollow artist', artist => ({ artist }))