import { createReducer } from 'redux-act'
import * as actions from './entryActions';

const defaultState = {
    query: '',
    entries: [],
    recent: []
}

const entryReducer = createReducer({
    [actions.searchEntries]: (state, payload) => {
        return { ...state, query: payload.query}
    },
    [actions.searchEntriesSuccess]: (state, payload) => {
        return { ...state, entries: payload.result }
    },
    [actions.clearSearch]: (state) => {
        return{ ...state, entries: [] }
    },
    [actions.saveRecentSearch]: (state, payload) => {
        const recentList = state.recent
        let newEntry = payload.entry
        if(recentList.indexOf(newEntry.id) != 0) {
            recentList.unshift(newEntry.id)
            return { ...state, recent: recentList}
        }
        return state
    },
    [actions.clearRecentSearch]: (state) => {
        return { ...state, recent: [] }
    }
}, defaultState)

export default entryReducer
