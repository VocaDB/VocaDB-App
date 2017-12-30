const prefix = 'AUTH_';
const createActionType = action => prefix + action;

export const SAVE = createActionType('SAVE');
export const SAVE_SUCCESS = createActionType('SAVE_SUCCESS');
export const GET = createActionType('GET');
export const GET_SUCCESS = createActionType('GET_SUCCESS');
export const ERROR = createActionType('ERROR');