import { createAction } from 'redux-act'
import { normalize } from 'normalizr'
import schema from './releaseEventSchema'

export const fetchLatestReleaseEvents = createAction('fetch latest releaseEvents', () => ({ loading: true }))
export const fetchLatestReleaseEventsSuccess =  createAction('fetch latest releaseEvents success', data => normalize(data, [ schema ]))

export const fetchReleaseEventDetail = createAction(id => ({ loading: true, id }))
export const fetchReleaseEventDetailSuccess = createAction(data => normalize(data, schema))
