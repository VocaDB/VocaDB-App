import { createReducer } from 'redux-act'
import * as actions from './actions';
import { fromJS } from 'immutable';

const defaultState = fromJS({
    event: 0
})

const reducer = createReducer({
    [actions.getEventSuccess]: (state, payload) => {
        console.log(payload.result)
        return state.set('event', fromJS(payload.result))
            .set('loading', false)
    }
}, defaultState)

export default reducer
