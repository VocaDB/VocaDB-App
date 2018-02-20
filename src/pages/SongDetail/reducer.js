import { createReducer } from 'redux-act'
import * as actions from './actions';
import { fromJS } from 'immutable';

const defaultState = fromJS({
    song: 0
})

const reducer = createReducer({
    [actions.getSongSuccess]: (state, payload) => {
        return state.set('song', fromJS(payload.result))
    }
}, defaultState)

export default reducer
