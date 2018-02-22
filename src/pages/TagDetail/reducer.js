import { createReducer } from 'redux-act'
import * as actions from './actions';
import { fromJS } from 'immutable';

const defaultState = fromJS({
    tag: 0,
    topSongs: [],
    topArtists: [],
    topAlbums: []
})

const reducer = createReducer({
    [actions.getTagSuccess]: (state, payload) => {
        return state.set('tag', fromJS(payload.result))
            .set('loading', false)
    },
    [actions.getTopSongsSuccess]: (state, payload) => {
        return state.set('topSongs', fromJS(payload.result))
            .set('loading', false)
    },
    [actions.getTopArtistsSuccess]: (state, payload) => {
        return state.set('topArtists', fromJS(payload.result))
            .set('loading', false)
    },
    [actions.getTopAlbumsSuccess]: (state, payload) => {
        return state.set('topAlbums', fromJS(payload.result))
            .set('loading', false)
    }
}, defaultState)

export default reducer
