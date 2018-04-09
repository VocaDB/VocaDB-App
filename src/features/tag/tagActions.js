import { createAction } from 'redux-act'
import { normalize } from 'normalizr'
import tagSchema from './tagSchema'
import songSchema from './../song/songSchema'
import artistSchema from './../artist/artistSchema'
import albumSchema from './../album/albumSchema'

export const searchTags = createAction('Search tags', params => ({ params }))
export const addTagsSearchResult = createAction('Add tags search result', data => normalize(data, [ tagSchema ]))
export const appendTagsSearchResult = createAction('Append tags search result', data => normalize(data, [ tagSchema ]))

export const fetchTagDetail = createAction(id => ({ loading: true, id }))
export const fetchTagDetailSuccess = createAction(data => normalize(data, tagSchema))

export const fetchTopSongsByTag = createAction('fetch top songs by tag', tagId => ({ loading: true, tagId }))
export const fetchTopSongsByTagSuccess =  createAction('fetch top songs by tag success', data => normalize(data, [ songSchema ]))

export const fetchTopArtistsByTag = createAction('fetch top artists by tag', tagId => ({ loading: true, tagId }))
export const fetchTopArtistsByTagSuccess =  createAction('fetch top artists by tag success', data => normalize(data, [ artistSchema ]))

export const fetchTopAlbumsByTag = createAction('fetch top albums by tag', tagId => ({ loading: true, tagId }))
export const fetchTopAlbumsByTagSuccess =  createAction('fetch top albums by tag success', data => normalize(data, [ albumSchema ]))

export const fetchLatestSongsByTagDetail = createAction('fetch latest songs by tag detail')
export const addLatestSongsByTagId = createAction('add latest songs by tag id', (id, data) => ({ id, data: normalize(data, [ songSchema ]) }))

export const clearSearch = createAction('Clear search artist')