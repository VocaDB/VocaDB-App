import { createReducer } from 'redux-act'
import * as actions from './songActions';
import merge from 'deepmerge';
import _ from 'lodash'

export const defaultSearchParams = {
    nameMatchMode: 'auto',
    maxResults: 50,
    start: 0,
    fields: 'thumbUrl',
    songTypes: '',
    artistId: [],
    tagId: [],
    sort: 'Name'
}

export const defaultState = {
    searchResult: [],
    searchParams: defaultSearchParams,
    noResult: false,
    all: [],
    followed: [],
    highlighted: [],
    favoriteSongs: [],
    detail: 0
}

const reducer = createReducer({
    [actions.fetchHighlightedSuccess]: (state, payload) => {
        return { ...state, highlighted: payload.result }
    },
    [actions.fetchSearchSongs]: (state, payload) => {

        if(payload.replace) {
            console.log(payload.params)
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
    [actions.fetchSearchSongsSuccess]: (state, payload) => {

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
    [actions.fetchLatestSongsSuccess]: (state, payload) => {
        return { ...state, all: payload.result }
    },
    [actions.fetchFollowedSongsSuccess]: (state, payload) => {
        return { ...state, followed: payload.result }
    },
    [actions.fetchSongDetailSuccess]: (state, payload) => {
        return { ...state, detail: payload.result }
    },
    [actions.addFavoriteSong]: (state, payload) => {
        const song = payload.song;

        if(!song) {
            return state
        }

        let currentFavoriteSongs = (state.favoriteSongs)? state.favoriteSongs : []

        if(currentFavoriteSongs.indexOf(song.id) >= 0) {
            return state
        }

        currentFavoriteSongs.unshift(song.id)

        return { ...state, favoriteSongs: currentFavoriteSongs }
    },
    [actions.removeFavoriteSong]: (state, payload) => {
        const song = payload.song;

        if(!song) {
            return state
        }

        let currentFavoriteSongs = state.favoriteSongs.filter(id => id != song.id)

        return { ...state, favoriteSongs: currentFavoriteSongs }
    }
}, defaultState)

export default reducer
