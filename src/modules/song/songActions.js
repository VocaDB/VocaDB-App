import { createAction } from 'redux-act'
import { normalize } from 'normalizr'
import songSchema from './songSchema'


export const fetchSearchSongs = createAction('fetch search songs', params => ({ loading: true, params }))
export const fetchSearchSongsSuccess =  createAction('fetch search songs success', (data, append) => {
    let nom = normalize(data, [ songSchema ])
    return { ...nom, append }
})

export const fetchLatestSongs = createAction('fetch latest songs', () => ({ loading: true }))
export const fetchLatestSongsSuccess =  createAction('fetch latest songs success', data => normalize(data, [ songSchema ]))

export const fetchFollowedSongs = createAction('fetch followed songs', (artistId) => ({ loading: true }))
export const fetchFollowedSongsSuccess =  createAction('fetch followed songs success', data => normalize(data, [ songSchema ]))

export const fetchSongDetail = createAction(id => ({ loading: true, id }))
export const fetchSongDetailSuccess = createAction(data => normalize(data, songSchema))

export const fetchPopularSongsByTag = createAction('fetch popular songs by tag', tagId => ({ loading: true, tagId }))
export const fetchPopularSongsByTagSuccess =  createAction('fetch popular songs by tag success', data => normalize(data, [ songSchema ]))