import { createAction } from 'redux-act'
import { normalize } from 'normalizr'
import releaseEventSchema from './releaseEventSchema'

export const fetchSearchEvents = createAction('fetch search events', (params, remove, replace) => ({ loading: true, params, remove, replace }))
export const fetchSearchEventsSuccess =  createAction('fetch search events success', (data, append) => {
    let nom = normalize(data, [ releaseEventSchema ])
    return { ...nom, append }
})


export const fetchLatestReleaseEvents = createAction('fetch latest releaseEvents', () => ({ loading: true }))
export const fetchLatestReleaseEventsSuccess =  createAction('fetch latest releaseEvents success', data => normalize(data, [ releaseEventSchema ]))

export const fetchReleaseEventDetail = createAction(id => ({ loading: true, id }))
export const fetchReleaseEventDetailSuccess = createAction(data => normalize(data, releaseEventSchema))
