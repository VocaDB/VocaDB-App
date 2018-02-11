import { createSelector } from 'reselect';
import { Map } from 'immutable'

const selectEntities = () => (state) => state.get('entities');
const createEntitySelector = name => () => createSelector(selectEntities(), entities => entities.get(name, Map({})))

export const selectSongEntity = createEntitySelector('songs')
export const selectAlbumEntity = createEntitySelector('albums')
export const selectArtistEntity = createEntitySelector('artists')