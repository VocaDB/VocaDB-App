const prefix = 'NAV_';
const createActionType = action => prefix + action;

export const BACK = createActionType('BACK');
export const ROOT_VIEW = createActionType('ROOT_VIEW');
export const HOME_VIEW = createActionType('HOME_VIEW');
export const SONG_VIEW = createActionType('SONG_VIEW');
export const ALBUM_VIEW = createActionType('ALBUM_VIEW');
export const ARTIST_VIEW = createActionType('ARTIST_VIEW');
export const SEARCH_VIEW = createActionType('SEARCH_VIEW');
export const EVENT_VIEW = createActionType('EVENT_VIEW');
export const TAG_VIEW = createActionType('TAG_VIEW');