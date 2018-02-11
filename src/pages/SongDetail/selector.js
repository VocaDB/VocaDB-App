import { createSelector } from 'reselect';
import { selectSongEntity } from './../../selectors'

const selectSongDetail = () => (state) => state.get('songDetail');
const selectSongId = () => createSelector(
    selectSongDetail(),
    (songDetailState) => songDetailState.get('song')
)

const selectSong = () => createSelector(
    selectSongEntity(),
    selectSongId(),
    (songs, id) => {
        if(!id || !songs) {
            return {};
        }
        return songs.get(id.toString()).toJS();
    }
);

export {
    selectSong,
};