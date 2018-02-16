import { createReducer } from 'redux-act'
import * as actions from './actions';
import { fromJS } from 'immutable';

const defaultState = fromJS({
    refreshing: false,
    recentSongs: [],
    popularSongs: []
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
    }
}, defaultState)

export default reducer
