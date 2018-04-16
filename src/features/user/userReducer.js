import { createReducer } from 'redux-act'
import { AsyncStorage } from 'react-native'
import { authKey } from './../../common/constants/storageKey'
import * as actions from './userActions';

export const defaultState = {
    followedArtists: [],
    token: '',
    skipSignIn: false
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
    },
    [actions.signInSuccess]: (state, payload) => {
        if(!payload || !payload.token) {
            return { ...state, token: ''}
        }

        return { ...state, token: payload.token };
    },
    [actions.skipSignIn]: (state) => {
        return { ...state, skipSignIn: true }
    },
    [actions.signOut]: (state) => {
        AsyncStorage.removeItem(authKey.token);
        return { ...state, token: '', skipSignIn: false }
    }
}, defaultState)

export default reducer
