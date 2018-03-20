import { createAction } from 'redux-act'
import { normalize } from 'normalizr'
import albumSchema from './albumSchema'

export const fetchSearchAlbums = createAction('fetch search albums', (params, remove) => ({ loading: true, params, remove }))
export const fetchSearchAlbumsSuccess =  createAction('fetch search albums success', (data, append) => {
    let nom = normalize(data, [ albumSchema ])
    return { ...nom, append }
})


export const fetchLatestAlbums = createAction('fetch latest albums', () => ({ loading: true }))
export const fetchLatestAlbumsSuccess =  createAction('fetch latest albums success', data => normalize(data, [ albumSchema ]))

export const fetchTopAlbums = createAction('fetch top albums', () => ({ loading: true }))
export const fetchTopAlbumsSuccess =  createAction('fetch top albums success', data => normalize(data, [ albumSchema ]))

export const fetchAlbumDetail = createAction(id => ({ loading: true, id }))
export const fetchAlbumDetailSuccess = createAction(data => normalize(data, albumSchema))
