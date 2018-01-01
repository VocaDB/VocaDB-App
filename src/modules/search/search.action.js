import * as types from './search.action.type'
import { createAction } from 'redux-act'

export const searchCancel = createAction(types.CANCEL)
export const searchTyping = createAction(types.TYPING, query => ({ query }))
export const entryRequest = createAction(types.ENTRY_REQUEST, query => ({ query }))
export const entrySuccess = createAction(types.ENTRY_SUCCESS, entries => ({ entries }))
export const entryError = createAction(types.ENTRY_ERROR)

