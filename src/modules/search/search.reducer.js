import {
    entrySuccess, entryRequest, entryError, searchCancel, searchTyping, saveRecent, deleteRecent, clearRecent
} from './search.action'
import { createReducer } from 'redux-act'

const defaultState = {
    query: '',
    loading: false,
    entries: [],
    recentList: []
}

const reducer = createReducer({
    [searchTyping]: (state, payload) => ({ ...state, query: payload.query }),
    [searchCancel]: (state) => ({ ...state, loading: false, entries: [], query: '' }),
    [entryRequest]: (state, payload) => ({ ...state, loading: true, query: payload.query }),
    [entrySuccess]: (state, payload) => ({ ...state, loading: false, entries: payload.entries }),
    [entryError]: (state, error) => ({ ...state, loading: false, error }),
    [saveRecent]: (state, payload) => {
        const newRecentList = state.recentList
        const recent = state.recentList.find(entry => entry.id === payload.entry.id)
        if(!recent) {
            newRecentList.unshift(payload.entry)
            return { ...state, recentList: newRecentList }
        }
        return state
    },
    [deleteRecent]: (state, payload) => ({ ...state, recentList: state.recentList.filter(entry => entry.id != payload.id) }),
    [clearRecent]: (state) => ({ ...state, recentList: [] })
}, defaultState)

export default reducer
