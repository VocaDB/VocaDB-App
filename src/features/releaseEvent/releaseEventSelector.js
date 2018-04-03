import { createSelector } from 'reselect';
import Routes from './../../app/appRoutes'
import { selectNav } from './../../app/appSelector'
import { selectSongEntity } from './../song/songSelector'
import { selectAlbumEntity } from './../album/albumSelector'

export const convertEventIds = (eventIds, eventEntity) => eventIds
    .filter(id => (id != undefined && eventEntity[id.toString()]))
    .map(id => eventEntity[id.toString()])

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
    (releaseEventIds, releaseEventEntity) => releaseEventIds
        .filter(id => (id != undefined && releaseEventEntity[id.toString()]))
        .map(id => releaseEventEntity[id.toString()])
)

export const selectReleaseEventDetail = () => createSelector(
    selectReleaseEventDetailId(),
    selectReleaseEventEntity(),
    (releaseEventDetailId, releaseEventEntity) => releaseEventEntity[releaseEventDetailId.toString()]
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
    selectReleaseEvent(),
    releaseEvent => (releaseEvent.publishedSongs) ? releaseEvent.publishedSongs : []
)

export const selectPublishedSongs = () => createSelector(
    selectPublishedSongIds(),
    selectSongEntity(),
    (songIds, songEntity) => songIds
        .filter(id => (id != undefined && songEntity[id.toString()]))
        .map(id => songEntity[id.toString()])
)

export const selectAlbumIds = () => createSelector(
    selectReleaseEvent(),
    releaseEvent => (releaseEvent.albums) ? releaseEvent.albums : []
)

export const selectAlbums = () => createSelector(
    selectAlbumIds(),
    selectAlbumEntity(),
    (albumIds, albumEntity) => albumIds
        .filter(id => (id != undefined && albumEntity[id.toString()]))
        .map(id => albumEntity[id.toString()])
)