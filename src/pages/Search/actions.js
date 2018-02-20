import { normalize } from 'normalizr'
import schemas from './../../schema'
import { createAction } from 'redux-act'

export const clearSearch = createAction('Clear search')
export const searchEntries = createAction('Search entries', query => ({ query }))
export const searchEntriesSuccess = createAction('Search entries success', data => normalize(data, [ schemas['entries'] ]))
