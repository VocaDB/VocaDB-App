const prefix = 'PROFILE_';
const createActionType = action => prefix + action;

export const SIGN_OUT = createActionType('SIGN_OUT');
export const SIGN_IN = createActionType('SIGN_IN');