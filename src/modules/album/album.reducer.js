import { createReducer } from 'redux-act'
import {getAlbum, getAlbumError, getAlbumSuccess} from "./album.action";

const defaultState = {
    loading: false,
    album: {}
}

const reducer = createReducer({
    [getAlbum]: (state) => ({ ...state, loading: true }),
    [getAlbumSuccess]: (state, payload) => ({ ...state, loading: false, album: payload.album }),
    [getAlbumError]: (state, error) => ({ ...state, error, loading: false })
}, defaultState)

export default reducer
