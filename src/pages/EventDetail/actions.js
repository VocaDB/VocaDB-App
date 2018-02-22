import { normalize } from 'normalizr'
import schemas from './../../schema'
import { createAction } from 'redux-act'

export const getEvent = createAction('Get event', id => ({ id }))
export const getEventSuccess = createAction('Get event success', data => normalize(data, schemas['events']))