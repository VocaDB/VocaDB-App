import { createSelector } from 'reselect';
import { List, Map } from 'immutable'
import { selectSongEntity, selectArtistEntity, selectAlbumEntity, selectTagEntity } from './../../selectors'

const selectTagDetail = () => (state) => state.get('tagDetail');
const selectTagResult = () => createSelector(selectTagDetail(), state => state.get('tag', 0))
const selectTopSongsResult = () => createSelector(selectTagDetail(), state => state.get('topSongs', []))
const selectTopArtistsResult = () => createSelector(selectTagDetail(), state => state.get('topArtists', []))
const selectTopAlbumsResult = () => createSelector(selectTagDetail(), state => state.get('topAlbums', []))
const selectLoading = () => createSelector(selectTagDetail(), state => state.get('loading', false))

const selectTag = () => createSelector(
    selectTagDetail(),
    selectTagEntity(),
    (tagDetailState, tagEntity) => {
        let tagId = tagDetailState.get('tag')

        if(!tagId || !tagEntity.has(tagId.toString())) {
            return {};
        }

        return tagEntity.get(tagId.toString()).toJS();
    }
);

const selectTopSongs = () => createSelector(
    selectSongEntity(),
    selectTopSongsResult(),
    (songs, topSongs) => {

        if(!topSongs) {
            return [];
        }

        return topSongs.map(id => songs.get(id.toString())).toJS();
    }
);

const selectTopArtists = () => createSelector(
    selectArtistEntity(),
    selectTopArtistsResult(),
    (artistEntity, topArtists) => {

        if(!topArtists) {
            return [];
        }

        return topArtists.map(id => artistEntity.get(id.toString())).toJS();
    }
);

const selectTopAlbums = () => createSelector(
    selectAlbumEntity(),
    selectTopAlbumsResult(),
    (albumEntity, topAlbums) => {

        if(!topAlbums) {
            return [];
        }

        return topAlbums.map(id => albumEntity.get(id.toString())).toJS();
    }
);

export {
    selectTagDetail,
    selectTagResult,
    selectTag,
    selectTopSongs,
    selectTopArtists,
    selectTopAlbums,
    selectLoading
};