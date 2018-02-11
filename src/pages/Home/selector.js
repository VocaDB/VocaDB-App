import { createSelector } from 'reselect';
import { List, Map } from 'immutable'
import { selectSongEntity } from './../../selectors'

const selectHome = () => (state) => state.get('home');
const selectRecentSongsResult = () => createSelector(selectHome(), home => home.get('recentSongs', []))
const selectPopularSongsResult = () => createSelector(selectHome(), home => home.get('popularSongs', []))

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

export {
    selectRecentSongs,
    selectPopularSongs
};