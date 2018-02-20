import { createSelector } from 'reselect';
import {
    selectAlbumEntity,
    selectTagEntity,
    selectArtistEntity,
    selectWebLinkEntity,
    selectArtistRoleEntity,
    selectEventEntity,
    selectPVEntity
} from './../../selectors'
import { Map, List } from 'immutable'

export const selectAlbumDetail = () => (state) => state.get('albumDetail');

export const selectAlbum = () => createSelector(
    selectAlbumDetail(),
    selectAlbumEntity(),
    (albumDetailState, albumEntity) => {
        let albumId = albumDetailState.get('album')

        if(!albumId || !albumEntity.has(albumId.toString())) {
            return Map();
        }

        return albumEntity.get(albumId.toString());
    }
)
export const selectTags = () => createSelector(
    selectAlbum(),
    selectTagEntity(),
    (album, tagEntity) => {
        return album.get('tags', List())
            .filter(t => tagEntity.has(t.get('tag').toString()))
            .map(t =>  {
                const tag = tagEntity.get(t.get('tag').toString())
                return Map({})
                    .set('count', t.get('count'))
                    .set('tag', tag)
            })
    }
)

const generateSelector = (keys, selectEntity) => {
    return () => createSelector(
        selectAlbum(),
        selectEntity(),
        (domain, entity) => {
            return domain.getIn(keys, List())
                .filter(id => entity.has(id.toString()))
                .map(id => entity.get(id.toString()))
        }
    )
}

export const selectArtists = () => createSelector(
    selectAlbum(),
    selectArtistEntity(),
    (album, artistEntity) => {
        return album.get('artists', List())
            .filter(artistRole => artistRole != undefined)
            .filter(artistRole => artistRole.get('artist') != undefined)
            .filter(artistRole => artistEntity.has(artistRole.get('artist').toString()))
            .map(artistRole => {
                const artistId = artistRole.get('artist')
                return artistRole.set('artist', artistEntity.get(artistId.toString()))
            })
    }
)

export const selectWebLinks = generateSelector(['webLinks'], selectWebLinkEntity)
export const selectPVs = generateSelector(['pvs'], selectPVEntity)

export const selectReleaseEvent = () => createSelector(
    selectAlbum(),
    selectEventEntity(),
    (album, eventEntity) => {
        let eventId = album.get('releaseEvent')

        if(!eventId || !eventEntity.has(eventId.toString())) {
            return Map();
        }

        return eventEntity.get(eventId.toString());
    }
)

export const selectAlbumResult = () => createSelector(
    selectAlbum(),
    selectTags(),
    selectWebLinks(),
    selectArtists(),
    selectReleaseEvent(),
    (album, tags, webLinks, artists, releaseEvent) => {
        return Map({}).merge(album)
            .set('tags', tags)
            .set('artists', artists)
            .set('webLinks', webLinks)
            .set('releaseEvent', releaseEvent)
            .toJS()
    }
)