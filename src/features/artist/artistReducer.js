import { createReducer } from 'redux-act'
import * as actions from './artistActions';
import merge from 'deepmerge';
import _ from 'lodash'

export const defaultSearchParams = {
    maxResults: 50,
    fields: 'MainPicture',
    nameMatchMode: 'auto',
    sort: 'ReleaseDate',
    start: 0,
    artistTypes: '',
    artistId: [],
    tagId: [],
}

export const defaultState = {
    detail: 0,
    followed: [],
    searchResult: [],
    searchParams: defaultSearchParams,
    noResult: false
}

const reducer = createReducer({
    [actions.fetchSearchArtists]: (state, payload) => {

        if(payload.replace) {
            let searchParams = _.merge({}, defaultSearchParams, payload.params)
            return { ...state, searchParams }
        }

        let searchParams = merge({}, state.searchParams)
        if(payload.remove) {
            _.forEach(payload.params, (value, key) => {
                searchParams[key] = _.pullAll(state.searchParams[key], value)
            })
        } else {
            searchParams = merge(state.searchParams, payload.params, {
                arrayMerge: (destinationArray, sourceArray) => {
                    return _.union(destinationArray, sourceArray)
                }
            })
        }

        return { ...state, searchParams }

    },
    [actions.fetchSearchArtistsSuccess]: (state, payload) => {

        if(payload.result.length === 0) {
            return { ...state, noResult: true }
        }

        if(payload.append) {
            let newSearchResult = state.searchResult;
            newSearchResult = newSearchResult.concat(payload.result);

            return { ...state, searchResult: newSearchResult, noResult: false }
        }
        return { ...state, searchResult: payload.result, noResult: false }
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
        return { ...state, searchResult: [] }
    }
}, defaultState)

export default reducer
