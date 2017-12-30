// @flow

import { put, takeLatest, all, call } from 'redux-saga/effects'
import Api from './home.api'
import * as actions from './home.action'
import { RECENT_SONGS_REQUEST, RECENT_ALBUMS_REQUEST, EVENTS_REQUEST } from './home.action.type'

const fetchSongList = function* fetchSongList() {
    try {
        const response = yield call(Api.songs.list);
        yield put(actions.listRecentSongSuccess(response.items));
    } catch (e) {
        yield put(actions.listRecentSongError(e));
    }
}

const fetchRecentAlbum = function* fetchRecentAlbum() {
    try {
        const response = yield call(Api.albums.list);
        yield put(actions.listRecentAlbumSuccess(response.items));
    } catch (e) {
        yield put(actions.listRecentAlbumError(e));
    }
}

const fetchEvents = function* fetchEvents() {
    try {
        console.log('fetchEvent')
        const response = yield call(Api.events.list);
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
