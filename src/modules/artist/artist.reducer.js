import { createReducer } from 'redux-act'
import {getArtist, getArtistError, getArtistSuccess} from "./artist.action";

const defaultState = {
    loading: false,
    artist: {}
}

const reducer = createReducer({
    [getArtist]: (state) => ({ ...state, loading: true }),
    [getArtistSuccess]: (state, payload) => ({ ...state, loading: false, artist: payload.artist }),
    [getArtistError]: (state, error) => ({ ...state, error, loading: false })
}, defaultState)

export default reducer
