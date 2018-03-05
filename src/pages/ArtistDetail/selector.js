import { createSelector } from 'reselect';
import {
    selectSongEntity,
    selectTagEntity,
    selectAlbumEntity,
    selectArtistEntity,
    selectWebLinkEntity,
    selectEventEntity
} from './../../selectors'
import { selectFollowedArtists } from '../../modules/user/userSelector'
import { Map, List } from 'immutable'

export const selectArtistDetail = () => (state) => state.get('artistDetail');

export const selectArtist = () => createSelector(
    selectArtistDetail(),
    selectArtistEntity(),
    (artistDetailState, artistEntity) => {
        let artistId = artistDetailState.get('artist')

        if(!artistId || !artistEntity.has(artistId.toString())) {
            return Map();
        }

        return artistEntity.get(artistId.toString());
    }
)
export const selectTags = () => createSelector(
    selectArtist(),
    selectTagEntity(),
    (artist, tagEntity) => {
        return artist.get('tags', List())
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
        selectArtist(),
        selectEntity(),
        (domain, entity) => {
            return domain.getIn(keys, List())
                .filter(id => entity.has(id.toString()))
                .map(id => entity.get(id.toString()))
        }
    )
}

export const selectLatestAlbums = generateSelector(['relations', 'latestAlbums'], selectAlbumEntity)
export const selectLatestSongs = generateSelector(['relations', 'latestSongs'],selectSongEntity)
export const selectPopularAlbums = generateSelector(['relations', 'popularAlbums'], selectAlbumEntity)
export const selectPopularSongs = generateSelector(['relations', 'popularSongs'], selectSongEntity)
export const selectLatestEvents = generateSelector(['relations', 'latestEvents'], selectEventEntity)
export const selectWebLinks = generateSelector(['webLinks'], selectWebLinkEntity)

export const selectIsFollowedArtist = () => createSelector(
    selectArtist(),
    selectFollowedArtists(),
    (artist, followedArtist) => {
        return (artist.has('id') && followedArtist.has(artist.get('id').toString()))? true : false
    }
)

export const selectArtistResult = () => createSelector(
    selectArtist(),
    selectTags(),
    selectLatestAlbums(),
    selectLatestSongs(),
    selectPopularAlbums(),
    selectPopularSongs(),
    selectLatestEvents(),
    selectWebLinks(),
    (artist, tags, latestAlbums, latestSongs, popularAlbums, popularSongs, latestEvents, webLinks) => {
        return Map({}).merge(artist)
            .set('tags', tags)
            .set('latestAlbums', latestAlbums)
            .set('latestSongs', latestSongs)
            .set('popularAlbums', popularAlbums)
            .set('popularSongs', popularSongs)
            .set('latestEvents', latestEvents)
            .set('webLinks', webLinks)
            .toJS()
    }
)