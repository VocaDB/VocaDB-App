import { createAction } from 'redux-act'
import { normalize } from 'normalizr'
import albumSchema from './albumSchema'
import tagSchema from "../tag/tagSchema";

export const fetchSearchAlbums = createAction('fetch search albums', (params, remove, replace) => ({ loading: true, params, remove, replace }))
export const fetchSearchAlbumsSuccess =  createAction('fetch search albums success', (data, append) => {
    let nom = normalize(data, [ albumSchema ])
    return { ...nom, append }
})


export const fetchLatestAlbums = createAction('fetch latest albums', () => ({ loading: true }))
export const fetchLatestAlbumsSuccess =  createAction('fetch latest albums success', data => normalize(data, [ albumSchema ]))

export const fetchTopAlbums = createAction('fetch top albums', () => ({ loading: true }))
export const fetchTopAlbumsSuccess =  createAction('fetch top albums success', data => normalize(data, [ albumSchema ]))

export const fetchAlbumDetail = createAction(id => ({ loading: true, id }))
export const fetchAlbumDetailSuccess = createAction(data => normalize(data, albumSchema))

export const addFavoriteAlbum = createAction('Add favorite album', album => ({ album }))
export const removeFavoriteAlbum = createAction('Remove favorite album', album => ({ album }))

export const updateSearchParams = createAction('Update search params', (name, value) => ({ name, value }))
export const removeSearchParamsArray = createAction('Remove value in params array from given value', (name, value) => ({ name, value }))
export const addSearchParamsArray = createAction('Add value in params array from given value', (name, value) => ({ name, value }))
export const addSearchResult = createAction('Add search result', data => normalize(data, [ albumSchema ]))
export const setSearchResult = createAction('Set search result', data => normalize(data, [ albumSchema ]))
export const fetchMoreSearchResult = createAction('Fetch more search result')
export const onSearching = createAction('Searching', text => ({ text }))
export const addFilterTag = createAction('add filter tag', data => normalize(data,  tagSchema))
export const removeFilterTag = createAction('remove filter tag', data => normalize(data,  tagSchema))

export const addParamsToPageId = createAction('View albums by given parameters', (pageId, params) => ({ pageId, params }))
export const fetchMoreResultOnPageId = createAction('Fetch more albums from specific page id', (pageId) => ({ pageId }))
export const addResultToPageId = createAction('Add to single list result', (pageId, data) => {
    let normalized = normalize(data, [ albumSchema ])
    normalized.pageId = pageId
    return normalized
})
export const setResultToPageId = createAction('Add to single list result', (pageId, data) => {
    let normalized = normalize(data, [ albumSchema ])
    normalized.pageId = pageId
    return normalized
})
export const clearSinglePageState = createAction('Clear single page state')