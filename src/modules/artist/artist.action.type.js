// @flow

const prefix = 'ARTIST_';
const createActionType = action => prefix + action;

export const GET = createActionType('GET');
export const GET_SUCCESS = createActionType('GET_SUCCESS');
export const GET_ERROR = createActionType('GET_ERROR');