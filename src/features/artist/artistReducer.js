import { createReducer } from 'redux-act'
import * as actions from './artistActions';

export const defaultState = {
    detail: 0,
    followed: [],
    searchResult: []
}

const reducer = createReducer({
    [actions.fetchSearchArtistsSuccess]: (state, payload) => {
        if(payload.append) {
            let newSearchResult = state.searchResult;
            newSearchResult = newSearchResult.concat(payload.result);

            return { ...state, searchResult: newSearchResult }
        }
        return { ...state, searchResult: payload.result }
    },
    [actions.fetchArtistDetailSuccess]: (state, payload) => {
        return { ...state, detail: payload.result }
    },
    [actions.followArtist]: (state, payload) => {
        const artist = payload.artist;

        if(!artist) {
            return state
        }

        let currentArtists = state.followed

        if(currentArtists.indexOf(artist.id) >= 0) {
            return state
        }

        currentArtists.unshift(artist.id)

        return { ...state, followed: currentArtists }
    },
    [actions.unFollowArtist]: (state, payload) => {
        const artist = payload.artist;

        if(!artist) {
            return state
        }

        let currentArtists = state.followed.filter(id => id != artist.id)

        return { ...state, followed: currentArtists }
    },
    [actions.clearSearch]: (state) => {
        console.log('clear')
        return { ...state, searchResult: [] }
    }
}, defaultState)

export default reducer
