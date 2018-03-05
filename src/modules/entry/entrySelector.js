import { createSelector } from 'reselect';

export const selectEntry = () => state => state.entry
export const selectEntryEntity = () => state => (state.entities && state.entities.entries)? state.entities.entries : {}
export const selectQuery = () => createSelector(
    selectEntry(),
    entry => entry.query
)
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
    (entryIds, entryEntity) => entryIds
        .filter(id => (id != undefined && entryEntity[id.toString()]))
        .map(id => entryEntity[id.toString()])
)

export const selectRecent = () => createSelector(
    selectRecentIds(),
    selectEntryEntity(),
    (entryIds, entryEntity) => entryIds
        .filter(id => (id != undefined && entryEntity[id.toString()]))
        .map(id => entryEntity[id.toString()])
)