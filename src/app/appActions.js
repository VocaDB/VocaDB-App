import { createAction } from 'redux-act'

export const requestError = createAction('Request error')
export const showMessage = createAction('Show message', message => ({ message }))
export const showLoading = createAction('Show loading', () => ({ loading: true }))
export const hideLoading = createAction('Hide loading', () => ({ loading: false }))