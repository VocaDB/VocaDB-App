import * as types from './search.action.type'
import { createAction } from 'redux-act'

export const searchCancel = createAction(types.CANCEL)
export const searchTyping = createAction(types.TYPING, query => ({ query }))
export const entryRequest = createAction(types.ENTRY_REQUEST, query => ({ query }))
export const entrySuccess = createAction(types.ENTRY_SUCCESS, entries => ({ entries }))
export const entryError = createAction(types.ENTRY_ERROR)
export const saveRecent = createAction(types.SAVE_RECENT, newEntry => ({ newEntry }))
export const saveRecentSuccess = createAction(types.SAVE_RECENT_SUCCESS, recentList => ({ recentList }))
export const saveRecentError = createAction(types.SAVE_RECENT_ERROR)
export const readRecent = createAction(types.READ_RECENT)
export const readRecentSuccess = createAction(types.READ_RECENT_SUCCESS, recentList => ({ recentList }))
export const readRecentError = createAction(types.READ_RECENT_ERROR)

