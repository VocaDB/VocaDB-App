import { createAction } from 'redux-act'

export const requestError = createAction('Request error')
export const showLoading = createAction('Show loading', () => ({ loading: true }))
export const hideLoading = createAction('Hide loading', () => ({ loading: false }))