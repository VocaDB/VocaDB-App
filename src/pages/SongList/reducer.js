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
        let result = fromJS(payload.result)
        let newList = state.get('songs').concat(result)
        return state.set('songs', newList)
            .set('refreshing', false)
    }
}, defaultState)

export default reducer
