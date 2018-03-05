import { createReducer } from 'redux-act'
import * as actions from './tagActions';

export const defaultState = {
    detail: 0
}

const reducer = createReducer({
    [actions.fetchTagDetailSuccess]: (state, payload) => {
        return { ...state, detail: payload.result }
    }
}, defaultState)

export default reducer
