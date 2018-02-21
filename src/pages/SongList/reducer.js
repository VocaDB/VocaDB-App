import { createReducer } from 'redux-act'
import * as actions from './actions';
import { fromJS } from 'immutable';

const defaultState = fromJS({
    refreshing: false,
    songs: []
})

const reducer = createReducer({
    [actions.getSongs]: (state, payload) => {
        return state.set('refreshing', true)
    },
    [actions.getSongsSuccess]: (state, payload) => {
        return state.set('songs', fromJS(payload.result))
            .set('refreshing', false)
    }
}, defaultState)

export default reducer
