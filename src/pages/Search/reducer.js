import { createReducer } from 'redux-act'
import * as actions from './actions';
import { fromJS, List } from 'immutable';

const defaultState = fromJS({
    query: '',
    loading: false,
    entries: [],
    recent: []
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
    },
    [actions.saveRecentSearch]: (state, payload) => {
        const recentList = state.get('recent')
        let newEntry = payload.entry
        if(recentList.indexOf(newEntry.id) != 0) {
            return state.set('recent', recentList.unshift(newEntry.id))
        }
        return state
    },
    [actions.clearRecentSearch]: (state) => {
        return state.set('recent', List())
    }
}, defaultState)

export default reducer
