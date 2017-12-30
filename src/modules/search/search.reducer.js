import { entrySuccess, entryRequest, entryError, searchCancel, searchTyping } from './search.action'
import { createReducer } from 'redux-act'

const defaultState = {
    q: '',
    loading: false,
    entries: []
}

const reducer = createReducer({
    [searchTyping]: (state, payload) => ({ ...state, q: payload.q }),
    [searchCancel]: (state) => ({ ...state, loading: false, entries: [], q: '' }),
    [entryRequest]: (state, payload) => ({ ...state, loading: true, q: payload.q }),
    [entrySuccess]: (state, payload) => ({ ...state, loading: false, entries: payload.entries }),
    [entryError]: (state, error) => ({ ...state, loading: false, error })
}, defaultState)

export default reducer
