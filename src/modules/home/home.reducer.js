import {
    listRecentSongRequest,
    listRecentSongSuccess,
    listRecentSongError,
    listRecentAlbumRequest,
    listRecentAlbumSuccess,
    listRecentAlbumError,
    listRecentEventRequest,
    listRecentEventSuccess,
    listRecentEventError,
    pullRefresh,
    pullRefreshFinished } from './home.action'
import { createReducer } from 'redux-act'

const defaultState = {
    loading: false,
    songs: [],
    albums: [],
    events: []
}

const reducer = createReducer({
    [listRecentSongRequest]: (state) => ({ ...state, loading: true }),
    [listRecentSongSuccess]: (state, payload) => ({ ...state, loading: false, songs: payload.songs }),
    [listRecentSongError]: (state, error) => ({ ...state, error, loading: false }),

    [listRecentAlbumRequest]: (state) => ({ ...state, loading: true }),
    [listRecentAlbumSuccess]: (state, payload) => ({ ...state, loading: false, albums: payload.albums }),
    [listRecentAlbumError]: (state, error) => ({ ...state, error, loading: false }),

    [listRecentEventRequest]: (state) => ({ ...state, loading: true }),
    [listRecentEventSuccess]: (state, payload) => ({ ...state, loading: false , events: payload.events }),
    [listRecentEventError]: (state, error) => ({ ...state, error, loading: false }),
}, defaultState)

export default reducer
