import { createReducer } from 'redux-act'
import * as actions from './actions';
import { fromJS } from 'immutable';

const defaultState = fromJS({
    artist: 0
})

const reducer = createReducer({
    [actions.getArtistSuccess]: (state, payload) => {
        return state.set('artist', fromJS(payload.result))
    }
}, defaultState)

export default reducer
