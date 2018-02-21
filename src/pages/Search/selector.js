import { createSelector } from 'reselect';
import { List, Map } from 'immutable'
import { selectEntryEntity } from './../../selectors'

const selectSearch = () => (state) => state.get('search');
const selectQuery = () => createSelector(selectSearch(), home => home.get('query', ''))
const selectEntriesResult = () => createSelector(selectSearch(), home => home.get('entries', []))
const selecrLoading = () => createSelector(selectSearch(), home => home.get('loading', false))

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

export {
    selectSearch,
    selectEntries,
    selecrLoading,
    selectQuery,
    selectEntriesResult
};