import { createSelector } from 'reselect';
import { List, Map } from 'immutable'
import { selectEntryEntity } from './../../selectors'

const selectSearch = () => (state) => state.get('search');
const selectQuery = () => createSelector(selectSearch(), home => home.get('query', ''))
const selectEntriesResult = () => createSelector(selectSearch(), home => home.get('entries', []))
const selectLoading = () => createSelector(selectSearch(), home => home.get('loading', false))

const selectSearching = () => createSelector(selectQuery(), query => (query) ? true : false)
const selectHasResult = () => createSelector(
    selectSearching(),
    selectEntriesResult(),
    (searching, entries) => (searching && entries.size > 0) ? true : false
)
const selectEntries = () => createSelector(
    selectEntryEntity(),
    selectEntriesResult(),
    (entryEntity, entriesResult) => {

        if(!entriesResult) {
            return [];
        }

        return entriesResult.map(id => entryEntity.get(id.toString())).toJS();
    }
);

const generateSelector = (keys, selectEntity) => {
    return () => createSelector(
        selectSearch(),
        selectEntity(),
        (domain, entity) => {
            return domain.getIn(keys, List())
                .filter(id => entity.has(id.toString()))
                .map(id => entity.get(id.toString()))
                .toJS()
        }
    )
}

// const selectRecentList = () => createSelector(selectSearch(), home => home.get('recent').toJS())

const selectRecentList = generateSelector(['recent'], selectEntryEntity)

export {
    selectSearch,
    selectEntries,
    selectLoading,
    selectQuery,
    selectEntriesResult,
    selectSearching,
    selectHasResult,
    selectRecentList
};