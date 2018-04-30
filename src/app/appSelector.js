import { createSelector } from 'reselect';

export const selectLoading = () => state => state.loading
export const selectError = () => state => (state.error)? state.error : false;
export const selectNav = () => state => state.nav