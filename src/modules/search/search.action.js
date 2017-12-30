import * as types from './search.action.type'
import { createAction } from 'redux-act'
import { SONG, ALBUM, EVENT, SEARCH } from './../../constants/routes'

export const searchCancel = createAction(types.CANCEL)
export const searchTyping = createAction(types.TYPING, q => ({ q }))
export const entryRequest = createAction(types.ENTRY_REQUEST, q => ({ q }))
export const entrySuccess = createAction(types.ENTRY_SUCCESS, entries => ({ entries }))
export const entryError = createAction(types.ENTRY_ERROR)

export const viewSong = createAction(types.SONG_VIEW, id => ({ routeName: SONG, id }))
export const viewAlbum = createAction(types.ALBUM_VIEW, id => ({ routeName: ALBUM, id }))

