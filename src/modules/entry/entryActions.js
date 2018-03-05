import { createAction } from 'redux-act'
import { normalize } from 'normalizr'
import schema from './entrySchema'

export const clearSearch = createAction('Clear search')
export const searchEntries = createAction('Search entries', query => ({ query }))
export const searchEntriesSuccess = createAction('Search entries success', data => normalize(data, [ schema ]))
export const saveRecentSearch = createAction('Save recent search', entry => ({ entry }))
export const clearRecentSearch = createAction('Clear recent search')
