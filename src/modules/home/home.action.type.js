// @flow

const prefix = 'HOME_';
const createActionType = action => prefix + action;

export const RECENT_SONGS_REQUEST = createActionType('RECENT_SONGS_REQUEST');
export const RECENT_SONGS_SUCCESS = createActionType('RECENT_SONGS_SUCCESS');
export const RECENT_SONGS_ERROR = createActionType('RECENT_SONGS_ERROR');

export const RECENT_ALBUMS_REQUEST = createActionType('RECENT_ALBUMS_REQUEST');
export const RECENT_ALBUMS_SUCCESS = createActionType('RECENT_ALBUMS_SUCCESS');
export const RECENT_ALBUMS_ERROR = createActionType('RECENT_ALBUMS_ERROR');

export const EVENTS_REQUEST = createActionType('RECENT_EVENTS_REQUEST');
export const EVENTS_SUCCESS = createActionType('RECENT_EVENTS_SUCCESS');
export const EVENTS_ERROR = createActionType('RECENT_EVENTS_ERROR');

export const PULL_REFRESH = createActionType('PULL_REFRESH')
export const PULL_REFRESH_FINISHED = createActionType('PULL_REFRESH_FINISHED')

export const SONG_VIEW = createActionType('SONG_VIEW');
export const ALBUM_VIEW = createActionType('ALBUM_VIEW');
export const SEARCH_VIEW = createActionType('SEARCH_VIEW');
export const EVENT_VIEW = createActionType('EVENT_VIEW');