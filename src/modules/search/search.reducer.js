import {
    entrySuccess, entryRequest, entryError, searchCancel, searchTyping, readRecentError,
    readRecentSuccess, saveRecent, saveRecentSuccess, saveRecentError
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
    [saveRecent]: (state, payload) => ({ ...state, newEntry: payload.newEntry }),
    [saveRecentSuccess]: (state, payload) => ({ ...state, recentList: payload.recentList }),
    [saveRecentError]: (state, error) => ({ ...state, loading: false, error }),
    [readRecentSuccess]: (state, payload) => ({ ...state, recentList: payload.recentList }),
    [readRecentError]: (state, error) => ({ ...state, loading: false, error }),
}, defaultState)

export default reducer
