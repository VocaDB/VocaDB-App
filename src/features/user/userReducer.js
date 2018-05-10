import { createReducer } from 'redux-act'
import { AsyncStorage } from 'react-native'
import { authKey } from './../../common/constants/storageKey'
import * as actions from './userActions';

// TODO Mock up2up user id
const mockUserId = 1065;

export const defaultState = {
    followedArtists: [],
    token: '',
    skipSignIn: false,
    userId: 0,
    albums: [],
    settings: {
        displayLanguage: 'Default'
    }
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
            return { ...state, token: '', userId: ''}
        }

        return { ...state, token: payload.token, userId: mockUserId };
    },
    [actions.skipSignIn]: (state) => {
        return { ...state, skipSignIn: true }
    },
    [actions.signOut]: (state) => {
        AsyncStorage.removeItem(authKey.token);
        return { ...state, token: '', skipSignIn: false, userId: '' }
    },
    [actions.updateAlbums]: (state, payload) => {
        return { ...state, albums: payload.result }
    }
}, defaultState)

export default reducer
