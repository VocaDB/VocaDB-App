import { createSelector } from 'reselect';

export const convertEntryIds = (entryIds, entryEntity) => (entryIds)? entryIds
    .filter(id => (id != undefined && entryEntity[id.toString()]))
    .map(id => entryEntity[id.toString()])
    .map(entry => ({
        ...entry,
        image: (entry.thumbUrl) ? entry.thumbUrl :
            (entry.mainPicture && entry.mainPicture.urlThumb) ? entry.mainPicture.urlThumb : 'https://via.placeholder.com/350x150/000000/ffffff?text=NO_IMAGE'
    })) : []

export const selectEntry = () => state => state.entry
export const selectEntryEntity = () => state => (state.entities && state.entities.entries)? state.entities.entries : {}
export const selectQuery = () => createSelector(
    selectEntry(),
    entry => entry.query
)
export const selectSearching = () => createSelector(selectQuery(), query => (query) ? true : false)

export const selectEntryIds = () => createSelector(
    selectEntry(),
    entry => entry.entries
)

export const selectRecentIds = () => createSelector(
    selectEntry(),
    entry => entry.recent
)

export const selectEntries = () => createSelector(
    selectEntryIds(),
    selectEntryEntity(),
    convertEntryIds
)

export const selectRecent = () => createSelector(
    selectRecentIds(),
    selectEntryEntity(),
    convertEntryIds
)

export const selectHasResult = () => createSelector(
    selectSearching(),
    selectEntries(),
    (searching, entries) => (searching && entries.length > 0) ? true : false
)