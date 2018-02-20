import { createReducer } from 'redux-act'
import * as actions from './actions';
import { fromJS, List } from 'immutable';

const defaultState = fromJS({
    query: '',
    loading: false,
    entries: [],
})

const reducer = createReducer({
    [actions.searchEntries]: (state, payload) => {
        return state.set('loading', true)
            .set('query', payload.query)
    },
    [actions.searchEntriesSuccess]: (state, payload) => {
        return state.set('entries', fromJS(payload.result))
            .set('loading', false)
    },
    [actions.clearSearch]: (state) => {
        return state.set('entries', List())
            .set('query', '')
    }
}, defaultState)

export default reducer
