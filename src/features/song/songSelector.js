import { createSelector } from 'reselect';
import { selectNav } from './../../app/appSelector'
import Routes from './../../app/appRoutes'
import { selectArtistEntity } from './../artist/artistSelector'
import { selectTagEntity, convertTagIds } from './../tag/tagSelector'
import { durationHoursHelper, filterByHelper, vocalistHelper } from './SongRanking/SongRankingHelper'
import { convertAlbumIds, selectAlbumEntity } from './../album/albumSelector'

export const convertSongIds = (entryIds, entryEntity) => (entryIds)? entryIds
    .filter(id => (id != undefined && entryEntity[id.toString()]))
    .map(id => entryEntity[id.toString()])
    .map(entry => ({
        ...entry,
        image: (entry.thumbUrl) ? entry.thumbUrl :
        (entry.mainPicture && entry.mainPicture.urlThumb) ? entry.mainPicture.urlThumb : 'https://via.placeholder.com/350x150/000000/ffffff?text=NO_IMAGE'
    })) : []


export const selectSong = () => state => state.song
export const selectSongEntity = () => state => (state.entities && state.entities.songs)? state.entities.songs : {}
export const selectEntities = () => state => state.entities
export const selectNoResult = () => createSelector(
    selectSong(),
    song => song.noResult
)
export const selectSearchParams = () => createSelector(
    selectSong(),
    song => song.searchParams
)
export const selectFilterArtists = () => createSelector(
    selectSearchParams(),
    selectArtistEntity(),
    (searchParams, artistEntity) => {
        if(!searchParams || !searchParams.artistId || !artistEntity) {
            return []
        }

        return searchParams.artistId.map(id => artistEntity[id.toString()])
    }
)
export const selectHighlightedIds = () => createSelector(
    selectSong(),
    song => song.highlighted
)
export const selectSearchResultIds = () => createSelector(
    selectSong(),
    song => song.searchResult
)
export const selectLatestSongIds = () => createSelector(
    selectSong(),
    song => song.all
)
export const selectFollowedSongIds = () => createSelector(
    selectSong(),
    song => song.followed
)
export const selectSongDetailId = () => createSelector(
    selectNav(),
    nav => (nav
        && nav.routes[nav.index]
        && nav.routes[nav.index].routeName === Routes.SongDetail)? nav.routes[nav.index].params.id : 0
)

export const selectHighlighted = () => createSelector(
    selectHighlightedIds(),
    selectSongEntity(),
    convertSongIds
)

export const selectSearchResult = () => createSelector(
    selectSearchResultIds(),
    selectSongEntity(),
    convertSongIds
)

export const selectLatestSongs = () => createSelector(
    selectLatestSongIds(),
    selectSongEntity(),
    convertSongIds
)

export const selectFollowedSongs = () => createSelector(
    selectFollowedSongIds(),
    selectSongEntity(),
    convertSongIds
);

export const selectFavoriteSongIds = () => createSelector(
    selectSong(),
    songState => {
        return (songState.favoriteSongs) ? songState.favoriteSongs : []
    }
)

export const selectFavoriteSongs = () => createSelector(
    selectFavoriteSongIds(),
    selectSongEntity(),
    convertSongIds
)

export const selectSongDetail = () => createSelector(
    selectSongDetailId(),
    selectSongEntity(),
    (songDetailId, songEntity) => {
        return songEntity[songDetailId.toString()]
    }
)

export const selectAlbums = () => createSelector(
    selectSongDetail(),
    selectAlbumEntity(),
    (songDetail, albumEntity) => (songDetail && songDetail.albums)? convertAlbumIds(songDetail.albums, albumEntity) : []
)

export const selectIsFavoriteSong = () => createSelector(
    selectSong(),
    selectFavoriteSongIds(),
    (songState, favoriteSongIds) => {
        return (favoriteSongIds && favoriteSongIds.indexOf(songState.detail) >=0)? true : false
    }
)

export const selectSelectedFilterTagIds = () => createSelector(
    selectSearchParams(),
    (searchParams) => (searchParams && searchParams.tagId)? searchParams.tagId : []
)

export const selectSelectedFilterTags = () => createSelector(
    selectSelectedFilterTagIds(),
    selectTagEntity(),
    convertTagIds
)

export const selectFilterTagIds = () => createSelector(
    selectSong(),
    (songState) => (songState.filterTags)? songState.filterTags : []
)

export const selectFilterTags = () => createSelector(
    selectFilterTagIds(),
    selectTagEntity(),
    selectSelectedFilterTagIds(),
    (tagIds, tagEntity, selectedTagIds) => {
        return convertTagIds(tagIds, tagEntity).map(t => ({ ...t, selected: selectedTagIds.includes(t.id) }))
    }
)

export const selectRankingState = () => createSelector(
    selectSong(),
    (songState) => {
        if(!songState || !songState.ranking) {
            return {
                durationHours: durationHoursHelper.values.Weekly,
                filterBy: filterByHelper.values.NewlyAdded,
                vocalist: vocalistHelper.values.All,
                songs: []
            }
        }

        const ranking = songState.ranking;
        const durationHours = (ranking.durationHours != undefined)? ranking.durationHours : durationHoursHelper.values.Weekly;
        const filterBy = (ranking.filterBy != undefined)? ranking.filterBy : filterByHelper.values.NewlyAdded;
        const vocalist = (ranking.vocalist != undefined)? ranking.vocalist : vocalistHelper.values.All;

        return {
            durationHours,
            filterBy,
            vocalist,
            songs: ranking.songs
        }
    }
)

export const selectRankingResult = () => createSelector(
    selectRankingState(),
    selectSongEntity(),
    (rankingState, songEntity) => {
        if(rankingState && rankingState.songs && songEntity) {
            return convertSongIds(rankingState.songs, songEntity);
        }

        return [];
    }
)