import * as types from './home.action.type'
import { createAction } from 'redux-act'
import { SONG, ALBUM, EVENT, SEARCH } from './../../constants/routes'

export const listRecentSongRequest = createAction(types.RECENT_SONGS_REQUEST)
export const listRecentSongSuccess = createAction(types.RECENT_SONGS_SUCCESS, songs => ({ songs }))
export const listRecentSongError = createAction(types.RECENT_SONGS_ERROR)

export const listRecentAlbumRequest = createAction(types.RECENT_ALBUMS_REQUEST)
export const listRecentAlbumSuccess = createAction(types.RECENT_ALBUMS_SUCCESS, albums => ({ albums }))
export const listRecentAlbumError = createAction(types.RECENT_ALBUMS_ERROR)

export const listRecentEventRequest = createAction(types.EVENTS_REQUEST)
export const listRecentEventSuccess = createAction(types.EVENTS_SUCCESS, events => ({ events }))
export const listRecentEventError = createAction(types.EVENTS_ERROR)

export const pullRefresh = createAction(types.PULL_REFRESH)
export const pullRefreshFinished = createAction(types.PULL_REFRESH_FINISHED)

export const viewSong = createAction(types.SONG_VIEW, id => ({ routeName: SONG, id }))
export const viewAlbum = createAction(types.ALBUM_VIEW, id => ({ routeName: ALBUM, id }))
export const viewEvent = createAction(types.EVENT_VIEW, id => ({ routeName: EVENT, id }))
export const viewSearch = createAction(types.SEARCH_VIEW, id => ({ routeName: SEARCH, id }))

