import { createAction } from 'redux-act'
import { normalize } from 'normalizr'
import artistSchema from './artistSchema'

export const fetchSearchArtists = createAction('fetch search artists', (params, remove, replace) => ({ loading: true, params, remove, replace }))
export const fetchSearchArtistsSuccess =  createAction('fetch search artists success', (data, append) => {
    let nom = normalize(data, [ artistSchema ])
    return { ...nom, append }
})

export const fetchArtistDetail = createAction(id => ({ loading: true, id }))
export const fetchArtistDetailSuccess = createAction(data => normalize(data, artistSchema))

export const followArtist = createAction('Follow artist', artist => ({ artist }))
export const unFollowArtist = createAction('UnFollow artist', artist => ({ artist }))

export const clearSearch = createAction('Clear search artist')