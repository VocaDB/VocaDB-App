// @flow

import { put, takeLatest, all, call } from 'redux-saga/effects'
import Api from './home.api'
import * as actions from './home.action'
import { RECENT_SONGS_REQUEST, RECENT_ALBUMS_REQUEST, EVENTS_REQUEST } from './home.action.type'
import myAPI from './../../api'

const fetchSongList = function* fetchSongList() {
    try {
        const response = yield call(myAPI.songs.find, { 'sort': 'AdditionDate', 'fields': 'thumbUrl' });
        yield put(actions.listRecentSongSuccess(response.items));
    } catch (e) {
        yield put(actions.listRecentSongError(e));
    }
}

const fetchRecentAlbum = function* fetchRecentAlbum() {
    try {
        const response = yield call(myAPI.albums.find, { 'sort': 'AdditionDate' });
        yield put(actions.listRecentAlbumSuccess(response.items));
    } catch (e) {
        yield put(actions.listRecentAlbumError(e));
    }
}

const fetchEvents = function* fetchEvents() {
    try {
        const response = yield call(myAPI.events.find);
        yield put(actions.listRecentEventSuccess(response.items));
    } catch (e) {
        yield put(actions.listRecentEventError(e));
    }
}

const homeSaga = function* homePageAsync() {
    yield takeLatest(RECENT_SONGS_REQUEST, fetchSongList)
    yield takeLatest(RECENT_ALBUMS_REQUEST, fetchRecentAlbum)
    yield takeLatest(EVENTS_REQUEST, fetchEvents)
}

export { fetchSongList, fetchRecentAlbum, fetchEvents }

export default homeSaga
