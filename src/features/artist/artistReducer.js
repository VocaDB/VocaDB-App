import { createReducer } from 'redux-act'
import * as actions from './artistActions';
import merge from "lodash/merge"

export const defaultState = {
    detail: 0,
    followed: [],
    searchResult: [],
    searchParams: { maxResults: 50, fields: 'MainPicture' },
    noResult: false
}

const reducer = createReducer({
    [actions.fetchSearchArtists]: (state, payload) => {
        let searchParams = merge({}, state.searchParams, payload.params)
        return { ...state, searchParams }
    },
    [actions.fetchSearchArtistsSuccess]: (state, payload) => {
        if(payload.append) {
            let newSearchResult = state.searchResult;
            newSearchResult = newSearchResult.concat(payload.result);
            console.log(newSearchResult)
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
