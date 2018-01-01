import { entrySuccess, entryRequest, entryError, searchCancel, searchTyping } from './search.action'
import { createReducer } from 'redux-act'

const defaultState = {
    query: '',
    loading: false,
    entries: []
}

const reducer = createReducer({
    [searchTyping]: (state, payload) => ({ ...state, query: payload.query }),
    [searchCancel]: (state) => ({ ...state, loading: false, entries: [], query: '' }),
    [entryRequest]: (state, payload) => ({ ...state, loading: true, query: payload.query }),
    [entrySuccess]: (state, payload) => ({ ...state, loading: false, entries: payload.entries }),
    [entryError]: (state, error) => ({ ...state, loading: false, error })
}, defaultState)

export default reducer
