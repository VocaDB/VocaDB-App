// @flow

import { put, takeLatest, call } from 'redux-saga/effects'
import * as actions from './album.action'
import * as actionTypes from './album.action.type'
import API from './../../api'

const getAlbum = function* getAlbum(action) {
    try {
        const response = yield call(API.albums.get, action.payload.id, { 'fields': 'Artists,Tags' });
        yield put(actions.getAlbumSuccess(response));
    } catch (e) {
        yield put(actions.getAlbumError(e));
    }
}

const albumSaga = function* albumPageSaga() {
    yield takeLatest(actionTypes.GET, getAlbum)
}

export { getAlbum }

export default albumSaga
