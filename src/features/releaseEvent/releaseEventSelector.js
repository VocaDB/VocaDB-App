import { createSelector } from 'reselect';
import Routes from './../../app/appRoutes'
import { selectNav } from './../../app/appSelector'
import { selectSongEntity, convertSongIds } from './../song/songSelector'
import { selectAlbumEntity, convertAlbumIds } from './../album/albumSelector'
import { transformSong } from './../song/songSelector'

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

export const selectSearchParams = () => createSelector(
    selectReleaseEvent(),
    event => event.searchParams
)

export const selectSearchResultIds = () => createSelector(
    selectReleaseEvent(),
    event => event.searchResult
)

export const selectSearchResult = () => createSelector(
    selectSearchResultIds(),
    selectReleaseEventEntity(),
    convertEventIds
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