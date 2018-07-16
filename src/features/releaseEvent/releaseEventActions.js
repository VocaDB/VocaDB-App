import { createAction } from 'redux-act'
import { normalize } from 'normalizr'
import releaseEventSchema from './releaseEventSchema'
import songSchema from './../song/songSchema'
import albumSchema from './../album/albumSchema'
import tagSchema from './../tag/tagSchema'

export const fetchSearchEvents = createAction('fetch search events', (params, remove, replace) => ({ loading: true, params, remove, replace }))
export const fetchSearchEventsSuccess =  createAction('fetch search events success', (data, append) => {
    let nom = normalize(data, [ releaseEventSchema ])
    return { ...nom, append }
})


export const fetchLatestReleaseEvents = createAction('fetch latest releaseEvents', () => ({ loading: true }))
export const fetchLatestReleaseEventsSuccess =  createAction('fetch latest releaseEvents success', data => normalize(data, [ releaseEventSchema ]))

export const fetchReleaseEventDetail = createAction(id => ({ loading: true, id }))
export const fetchReleaseEventDetailSuccess = createAction(data => normalize(data, releaseEventSchema))

export const fetchReleaseEventPublishedSongsSuccess = createAction(data => normalize(data, [ songSchema ]))

export const fetchReleaseEventAlbumsSuccess = createAction(data => normalize(data, [ albumSchema ]))

export const updateSearchParams = createAction('Update search params', (name, value) => ({ name, value }))
export const removeSearchParamsArray = createAction('Remove value in params array from given value', (name, value) => ({ name, value }))
export const addSearchParamsArray = createAction('Add value in params array from given value', (name, value) => ({ name, value }))
export const addSearchResult = createAction('Add search result', data => normalize(data, [ releaseEventSchema ]))
export const setSearchResult = createAction('Set search result', data => normalize(data, [ releaseEventSchema ]))
export const fetchMoreSearchResult = createAction('Fetch more search result')
export const onSearching = createAction('Searching', text => ({ text }))
export const addFilterTag = createAction('add filter tag', data => normalize(data,  tagSchema))
export const removeFilterTag = createAction('remove filter tag', data => normalize(data,  tagSchema))
export const clearFilter = createAction('Clear filter')