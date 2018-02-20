import { createReducer } from 'redux-act'
import * as actions from './actions';
import { fromJS } from 'immutable';

const defaultState = fromJS({
    refreshing: false,
    recentSongs: [],
    popularSongs: [],
    latestEvents: [],
    recentAlbums: []
})

const reducer = createReducer({
    [actions.getPopularSongs]: (state, payload) => {
        return state.set('refreshing', true)
    },
    [actions.getPopularSongsSuccess]: (state, payload) => {
        return state.set('popularSongs', fromJS(payload.result))
            .set('refreshing', false)
    },
    [actions.getRecentSongs]: (state, payload) => {
        return state.set('refreshing', true)
    },
    [actions.getRecentSongsSuccess]: (state, payload) => {
        return state.set('recentSongs', fromJS(payload.result))
            .set('refreshing', false)
    },
    [actions.getLatestEvents]: (state, payload) => {
        return state.set('refreshing', true)
    },
    [actions.getLatestEventsSuccess]: (state, payload) => {
        return state.set('latestEvents', fromJS(payload.result))
            .set('refreshing', false)
    },
    [actions.getRecentAlbums]: (state, payload) => {
        return state.set('refreshing', true)
    },
    [actions.getRecentAlbumsSuccess]: (state, payload) => {
        return state.set('recentAlbums', fromJS(payload.result))
            .set('refreshing', false)
    }
}, defaultState)

export default reducer
