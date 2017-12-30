const prefix = 'SEARCH_';
const createActionType = action => prefix + action;

export const CANCEL = createActionType('CANCEL');
export const TYPING = createActionType('TYPING');
export const ENTRY_REQUEST = createActionType('REQUEST');
export const ENTRY_SUCCESS = createActionType('SUCCESS');
export const ENTRY_ERROR = createActionType('ERROR');

export const BACK = createActionType('BACK');

export const MORE_SONG_VIEW = createActionType('MORE_SONG_VIEW');
export const MORE_ALBUM_VIEW = createActionType('MORE_ALBUM_VIEW');
export const MORE_SEARCH_VIEW = createActionType('MORE_SEARCH_VIEW');
