import { createSelector } from 'reselect';
import Routes from './../../app/appRoutes'
import { selectNav } from './../../app/appSelector'
import { selectArtistEntity, convertArtistIds } from './../artist/artistSelector'
import { selectSongEntity, convertSongIds } from './../song/songSelector'
import { selectAlbumEntity, convertAlbumIds } from './../album/albumSelector'
import { selectTagEntity, convertTagIds } from './../tag/tagSelector'
import { transformSong } from './../song/songSelector'
import { defaultSearchParams } from './releaseEventConstant'

export const transformEvent = (event) => {
    if(!event) {
        return {}
    }

    return {
        ...event,
        category: (event.series && event.series.category)? event.series.category : event.category,
        image: (event.mainPicture && event.mainPicture.urlThumb) ? event.mainPicture.urlThumb.replace('mainThumb', 'mainOrig') : undefined
    }
}

export const convertEventIds = (eventIds, eventEntity) => (eventIds) ? eventIds
    .filter(id => (id != undefined && eventEntity[id.toString()]))
    .map(id => eventEntity[id.toString()])
    .map(transformEvent): []

export const selectReleaseEvent = () => state => state.releaseEvent
export const selectReleaseEventEntity = () => state => (state.entities && state.entities.releaseEvents)? state.entities.releaseEvents : {}
export const selectLatestReleaseEventIds = () => createSelector(
    selectReleaseEvent(),
    releaseEvent => releaseEvent.all
)
export const selectReleaseEventDetailId = () => createSelector(
    selectNav(),
    nav => (nav
        && nav.routes[nav.index]
        && nav.routes[nav.index].routeName === Routes.EventDetail)? nav.routes[nav.index].params.id : 0
)

export const selectLatestReleaseEvents = () => createSelector(
    selectLatestReleaseEventIds(),
    selectReleaseEventEntity(),
    convertEventIds
)

export const selectReleaseEventDetail = () => createSelector(
    selectReleaseEventDetailId(),
    selectReleaseEventEntity(),
    (releaseEventDetailId, releaseEventEntity) => transformEvent(releaseEventEntity[releaseEventDetailId.toString()])
)

export const selectNoResult = () => createSelector(
    selectReleaseEvent(),
    event => event.noResult
)

export const selectPublishedSongIds = () => createSelector(
    selectReleaseEventDetail(),
    detail => (detail && detail.songs) ? detail.songs : []
)

export const selectPublishedSongs = () => createSelector(
    selectPublishedSongIds(),
    selectSongEntity(),
    convertSongIds
)

export const selectAlbumIds = () => createSelector(
    selectReleaseEventDetail(),
    detail => (detail && detail.albums) ? detail.albums : []
)

export const selectAlbums = () => createSelector(
    selectAlbumIds(),
    selectAlbumEntity(),
    convertAlbumIds
)

export const selectArtists = () => createSelector(
    selectReleaseEventDetail(),
    (eventDetail) => {
        if(!eventDetail || !eventDetail.artists || eventDetail.length === 0) {
            return {}
        }

        return eventDetail.artists.map(a => {
            if(a.effectiveRoles == 'Default' && a.artist && a.artist.artistType) {
                a.effectiveRoles = a.artist.artistType;
            }
            return a;
        })
    }
)

export const selectSongListSongs = () => createSelector(
    selectReleaseEventDetail(),
    (eventDetail) => {
        if(!eventDetail || !eventDetail.songList || !eventDetail.songList.songs || !eventDetail.songList.songs.length) {
            return {}
        }

        return eventDetail.songList.songs.map(s => transformSong(s.song));
    }
)

export const selectSeries = () => createSelector(
    selectReleaseEventDetail(),
    (eventDetail) => {
        if(!eventDetail || !eventDetail.series || !eventDetail.series.id) {
            return {}
        }

        return eventDetail.series;
    }
)

export const selectSearchParams = () => createSelector(
    selectReleaseEvent(),
    eventState => {

        if(!eventState || !eventState.searchPage || !eventState.searchPage.params) {
            return defaultSearchParams
        }

        const searchParams = eventState.searchPage.params;

        searchParams.sort = (searchParams.sort)? searchParams.sort : 'Date'
        searchParams.query = (searchParams.query)? searchParams.query : ''

        return searchParams;
    }
)

export const selectSearchResultIds = () => createSelector(
    selectReleaseEvent(),
    eventState => {
        let a = (eventState && eventState.searchPage && eventState.searchPage.results)? eventState.searchPage.results : []
        return a
    }
)

export const selectSearchResult = () => createSelector(
    selectSearchResultIds(),
    selectReleaseEventEntity(),
    convertEventIds
)

export const selectFilterArtists = () => createSelector(
    selectSearchParams(),
    selectArtistEntity(),
    (searchParams, artistEntity) => {
        if(!searchParams || !searchParams.artistId || !artistEntity) {
            return []
        }

        return convertArtistIds(searchParams.artistId, artistEntity);
    }
)

export const selectFilterTagIds = () => createSelector(
    selectSearchParams(),
    (searchParams) => {
        return (searchParams && searchParams.tagId)? searchParams.tagId : []
    }
)

export const selectFilterTags = () => createSelector(
    selectSearchParams(),
    selectTagEntity(),
    (params, tagEntity) => {
        return convertTagIds(params.tagId, tagEntity)
    }
)