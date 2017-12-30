import * as types from './search.action.type'
import { createAction } from 'redux-act'

export const searchCancel = createAction(types.CANCEL)
export const searchTyping = createAction(types.TYPING, q => ({ q }))
export const entryRequest = createAction(types.ENTRY_REQUEST, q => ({ q }))
export const entrySuccess = createAction(types.ENTRY_SUCCESS, entries => ({ entries }))
export const entryError = createAction(types.ENTRY_ERROR)

