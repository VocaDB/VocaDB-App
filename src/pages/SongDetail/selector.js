import { createSelector } from 'reselect';
import {
    selectSongEntity,
    selectTagEntity,
    selectAlbumEntity,
    selectArtistEntity,
    selectArtistRoleEntity
} from './../../selectors'
import { Map, List } from 'immutable'
import {selectLyricEntity, selectPVEntity, selectWebLinkEntity} from "../../selectors";

export const selectSongDetail = () => (state) => state.get('songDetail');

export const selectSong = () => createSelector(
    selectSongDetail(),
    selectSongEntity(),
    (songDetailState, songEntity) => {
        let songId = songDetailState.get('song')

        if(!songId || !songEntity.has(songId.toString())) {
            return Map();
        }

        return songEntity.get(songId.toString());
    }
)
export const selectTags = () => createSelector(
    selectSong(),
    selectTagEntity(),
    (song, tagEntity) => {
        return song.get('tags', List())
            .filter(t => tagEntity.has(t.get('tag').toString()))
            .map(t =>  {
                const tag = tagEntity.get(t.get('tag').toString())
                return Map({})
                    .set('count', t.get('count'))
                    .set('tag', tag)
            })
    }
)

export const selectAlbums = () => createSelector(
    selectSong(),
    selectAlbumEntity(),
    (song, albumEntity) => {
        return song.get('albums', List())
            .filter(id => albumEntity.has(id.toString()))
            .map(id => albumEntity.get(id.toString()))
    }
)

export const selectArtistRoles = () => createSelector(
    selectSong(),
    selectArtistRoleEntity(),
    selectArtistEntity(),
    (song, artistRoleEntity, artistEntity) => {
        return song.get('artists', List())
            .filter(id => artistRoleEntity.has(id.toString()))
            .map(id => artistRoleEntity.get(id.toString()))
            .map(artistRole => {

                const artistId = artistRole.get('artist')

                if(artistId) {
                    return artistRole.set('artist', artistEntity.get(artistRole.get('artist').toString()))
                } else {
                    const artist = Map().set('id', 465807)
                        .set('name', artistRole.get('name'))
                        .set('artistType', artistRole.get('roles'))
                    return artistRole.set('artist', artist)
                }

                return artistRole.set('artist', artistEntity.get(artistRole.get('artist').toString()))
            })
    }
)

export const selectLyrics = () => createSelector(
    selectSong(),
    selectLyricEntity(),
    (song, lyricEntity) => {
        return song.get('lyrics', List())
            .filter(id => lyricEntity.has(id.toString()))
            .map(id => lyricEntity.get(id.toString()))
    }
)

export const selectWebLinks = () => createSelector(
    selectSong(),
    selectWebLinkEntity(),
    (song, webLinkEntity) => {
        return song.get('webLinks', List())
            .filter(id => webLinkEntity.has(id.toString()))
            .map(id => webLinkEntity.get(id.toString()))
    }
)

export const selectPVs = () => createSelector(
    selectSong(),
    selectPVEntity(),
    (song, PVEntity) => {
        return song.get('pvs', List())
            .filter(id => PVEntity.has(id.toString()))
            .map(id => PVEntity.get(id.toString()))
    }
)

export const selectSongResult = () => createSelector(
    selectSong(),
    selectTags(),
    selectAlbums(),
    selectArtistRoles(),
    selectPVs(),
    selectWebLinks(),
    selectLyrics(),
    (song, tags, albums, artistRoles, pvs, webLinks, lyrics) => {
        return Map({}).merge(song)
            .set('tags', tags)
            .set('artists', artistRoles)
            .set('albums', albums)
            .set('pvs', pvs)
            .set('webLinks', webLinks)
            .set('lyrics', lyrics)
            .toJS()
    }
)