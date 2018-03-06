import { createAction } from 'redux-act'
import { normalize } from 'normalizr'
import albumSchema from './albumSchema'

export const fetchLatestAlbums = createAction('fetch latest albums', () => ({ loading: true }))
export const fetchLatestAlbumsSuccess =  createAction('fetch latest albums success', data => normalize(data, [ albumSchema ]))

export const fetchAlbumDetail = createAction(id => ({ loading: true, id }))
export const fetchAlbumDetailSuccess = createAction(data => normalize(data, albumSchema))
