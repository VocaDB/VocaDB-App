import { createSelector } from 'reselect';
import { selectSongEntity } from './../../selectors'

const selectHome = () => (state) => state.get('songList');
const selectSongsResult = () => createSelector(selectHome(), home => home.get('songs', []))
const selectRefreshing = () => createSelector(selectHome(), home => home.get('refreshing', false))

const selectSongs = () => createSelector(
    selectSongEntity(),
    selectSongsResult(),
    (songs, songsResult) => {
        if(!songsResult) {
            return [];
        }
        return songsResult.map(id => songs.get(id.toString())).toJS();
    }
);

export {
    selectHome,
    selectSongs,
    selectRefreshing
};