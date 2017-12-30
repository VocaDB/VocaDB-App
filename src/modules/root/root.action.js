import { createAction } from 'redux-act'
import * as types from './root.action.type'
import { SEARCH } from './../../constants/routes'

export const viewSearch = createAction(types.SEARCH_VIEW, () => ({ routeName: SEARCH }))

