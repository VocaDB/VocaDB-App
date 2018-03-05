import { createSelector } from 'reselect';
import { selectSongEntity } from './../../selectors'

const selectHome = () => (state) => state.songList;
const selectSongsResult = () => createSelector(selectHome(), home => home.songs)
const selectRefreshing = () => createSelector(selectHome(), home => home.refreshing)

const selectSongs = () => createSelector(
    selectSongEntity(),
    selectSongsResult(),
    (songs, songsResult) => {
        if(!songsResult) {
            return [];
        }
        return songsResult.map(id => songs[id.toString()]);
    }
);

export {
    selectHome,
    selectSongs,
    selectRefreshing
};