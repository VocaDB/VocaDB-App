import { createReducer } from 'redux-act'
import * as actions from './actions';
import { fromJS } from 'immutable';

const defaultState = fromJS({
    album: 0
})

const reducer = createReducer({
    [actions.getAlbumSuccess]: (state, payload) => {
        console.log(payload)
        return state.set('album', fromJS(payload.result))
    }
}, defaultState)

export default reducer
