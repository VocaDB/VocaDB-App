// @flow

import { put, takeLatest, call } from 'redux-saga/effects'
import * as actions from './song.action'
import * as actionTypes from './song.action.type'
import API from './../../api'

const getSong = function* getSong(action) {
    try {
        console.log(action)
        const response = yield call(API.songs.get, action.payload.id, { 'fields': 'PVs,Artists,Albums,Tags,ThumbUrl,Lyrics,WebLinks' });
        console.log(response)
        yield put(actions.getSongSuccess(response));
    } catch (e) {
        yield put(actions.getSongError(e));
    }
}

const songSaga = function* songPageSaga() {
    yield takeLatest(actionTypes.GET, getSong)
}

export { getSong }

export default songSaga
