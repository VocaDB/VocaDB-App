import { createReducer } from 'redux-act'
import * as actions from './actions';
import { fromJS } from 'immutable';

const defaultState = fromJS({
    recentSongs: [],
    popularSongs: []
})

const reducer = createReducer({
    [actions.getPopularSongsSuccess]: (state, payload) => {
        return state.set('popularSongs', fromJS(payload.result))
    },
    [actions.getRecentSongsSuccess]: (state, payload) => {
        return state.set('recentSongs', fromJS(payload.result))
    }
}, defaultState)

export default reducer
