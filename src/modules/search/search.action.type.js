const prefix = 'SEARCH_';
const createActionType = action => prefix + action;

export const CANCEL = createActionType('CANCEL');
export const TYPING = createActionType('TYPING');
export const ENTRY_REQUEST = createActionType('REQUEST');
export const ENTRY_SUCCESS = createActionType('SUCCESS');
export const ENTRY_ERROR = createActionType('ERROR');
export const SAVE_RECENT = createActionType('SAVE_RECENT');
export const DELETE_RECENT = createActionType('DELETE_RECENT');
export const CLEAR_RECENT = createActionType(('CLEAR_RECENT'))

export const BACK = createActionType('BACK');

export const MORE_SONG_VIEW = createActionType('MORE_SONG_VIEW');
export const MORE_ALBUM_VIEW = createActionType('MORE_ALBUM_VIEW');
export const MORE_SEARCH_VIEW = createActionType('MORE_SEARCH_VIEW');
