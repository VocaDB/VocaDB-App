import { createSelector } from 'reselect';
import { Map } from 'immutable'

export const selectEntities = () => (state) => state.get('entities');
const createEntitySelector = name => () => createSelector(selectEntities(), entities => entities.get(name, Map({})))

export const selectSongEntity = createEntitySelector('songs')
export const selectAlbumEntity = createEntitySelector('albums')
export const selectArtistEntity = createEntitySelector('artists')
export const selectArtistRoleEntity = createEntitySelector('artistRoles')
export const selectTagEntity = createEntitySelector('tags')
export const selectPVEntity = createEntitySelector('pvs')
export const selectLyricEntity = createEntitySelector('lyrics')
export const selectWebLinkEntity = createEntitySelector('webLinks')
export const selectEventEntity = createEntitySelector('events')