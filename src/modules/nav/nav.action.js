import * as types from './nav.action.type'
import { createAction } from 'redux-act'
import { NavigationActions } from "react-navigation";
import { SONG, ALBUM, EVENT, SEARCH, ROOT, ARTIST, TAG } from './../../constants/routes'

export const back = createAction(types.BACK, () => NavigationActions.back())
export const viewRoot = createAction(types.ROOT_VIEW, () => ({ routeName: ROOT }))
export const viewSong = createAction(types.SONG_VIEW, id => ({ routeName: SONG, id }))
export const viewAlbum = createAction(types.ALBUM_VIEW, id => ({ routeName: ALBUM, id }))
export const viewArtist = createAction(types.ARTIST_VIEW, id => ({ routeName: ARTIST, id }))
export const viewEvent = createAction(types.EVENT_VIEW, id => ({ routeName: EVENT, id }))
export const viewSearch = createAction(types.SEARCH_VIEW, () => ({ routeName: SEARCH }))
export const viewTag = createAction(types.TAG_VIEW, id => ({ routeName: TAG, id }))
