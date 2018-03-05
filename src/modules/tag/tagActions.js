import { createAction } from 'redux-act'
import { normalize } from 'normalizr'
import tagSchema from './tagSchema'

export const fetchTagDetail = createAction(id => ({ loading: true, id }))
export const fetchTagDetailSuccess = createAction(data => normalize(data, tagSchema))
