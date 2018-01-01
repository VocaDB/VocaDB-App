// @flow

import { put, takeLatest, call } from 'redux-saga/effects'
import * as actions from './artist.action'
import * as actionTypes from './artist.action.type'
import API from './../../api'

const getArtist = function* getArtist(action) {
    try {
        const response = yield call(API.artists.get, action.payload.id, { 'fields': 'Description,Tags,WebLinks', 'relations': 'all' });
        yield put(actions.getArtistSuccess(response));
    } catch (e) {
        yield put(actions.getArtistError(e));
    }
}

const artistSaga = function* artistPageSaga() {
    yield takeLatest(actionTypes.GET, getArtist)
}

export { getArtist }

export default artistSaga
