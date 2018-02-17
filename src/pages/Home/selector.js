import { createSelector } from 'reselect';
import { List, Map } from 'immutable'
import { selectSongEntity, selectEventEntity, selectAlbumEntity } from './../../selectors'

const selectHome = () => (state) => state.get('home');
const selectRecentSongsResult = () => createSelector(selectHome(), home => home.get('recentSongs', []))
const selectPopularSongsResult = () => createSelector(selectHome(), home => home.get('popularSongs', []))
const selectLatestEventsResult = () => createSelector(selectHome(), home => home.get('latestEvents', []))
const selectRecentAlbumsResult = () => createSelector(selectHome(), home => home.get('recentAlbums', []))
const selecrRefreshing = () => createSelector(selectHome(), home => home.get('refreshing', false))

const selectRecentSongs = () => createSelector(
    selectSongEntity(),
    selectRecentSongsResult(),
    (songs, recentSongsResult) => {

        if(!recentSongsResult) {
            return [];
        }

        return recentSongsResult.map(id => songs.get(id.toString())).toJS();
    }
);

const selectPopularSongs = () => createSelector(
    selectSongEntity(),
    selectPopularSongsResult(),
    (songs, popularSongsResult) => {

        if(!popularSongsResult) {
            return [];
        }

        return popularSongsResult.map(id => songs.get(id.toString())).toJS();
    }
);

const selectLatestEvents = () => createSelector(
    selectEventEntity(),
    selectLatestEventsResult(),
    (eventEntity, latestEventResult) => {

        if(!latestEventResult) {
            return [];
        }

        return latestEventResult.map(id => eventEntity.get(id.toString())).toJS();
    }
);

const selectRecentAlbums = () => createSelector(
    selectAlbumEntity(),
    selectRecentAlbumsResult(),
    (albumEntity, recentAlbumsResult) => {

        if(!recentAlbumsResult) {
            return [];
        }

        return recentAlbumsResult.map(id => albumEntity.get(id.toString())).toJS();
    }
);

export {
    selectRecentSongs,
    selectPopularSongs,
    selecrRefreshing,
    selectLatestEvents,
    selectRecentAlbums
};