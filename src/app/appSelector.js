import { createSelector } from 'reselect';

export const selectLoading = () => state => state.loading
export const selectError = () => state => state.error