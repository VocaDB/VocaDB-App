import { createAction } from 'redux-act'
import { normalize } from 'normalizr'
import entrySchema from './entrySchema'

export const clearSearch = createAction('Clear search')
export const searchEntries = createAction('Search entries', query => ({ query }))
export const searchEntriesSuccess = createAction('Search entries success', data => normalize(data, [ entrySchema ]))
export const saveRecentSearch = createAction('Save recent search', entry => ({ entry }))
export const clearRecentSearch = createAction('Clear recent search')
