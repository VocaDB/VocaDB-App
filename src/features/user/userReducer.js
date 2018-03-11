import { createReducer } from 'redux-act'
import * as actions from './userActions';

export const defaultState = {
    followedArtists: []
}

const reducer = createReducer({
    [actions.followArtist]: (state, payload) => {
        const artist = payload.artist;

        if(!artist) {
            return state
        }

        let currentArtists = state.followedArtists

        if(currentArtists.indexOf(artist.id) >= 0) {
            return state
        }

        currentArtists.unshift(artist.id)

        return { ...state, followedArtists: currentArtists }
    },
    [actions.unFollowArtist]: (state, payload) => {
        const artist = payload.artist;

        if(!artist) {
            return state
        }

        let currentArtists = state.followedArtists.filter(id => id != artist.id)

        return { ...state, followedArtists: currentArtists }
    }
}, defaultState)

export default reducer
