import { put, takeLatest, call } from 'redux-saga/effects'
import * as actions from './actions'
import api from './../../api'

const fetchPopularSongs = function* fetchPopularSongs() {
    try {
        const response = yield call(api.songs.find, { 'sort': 'FavoritedTimes', 'fields': 'thumbUrl' });
        yield put(actions.getPopularSongsSuccess(response.items));
    } catch (e) {
        console.log(e)
    }
}


const fetchRecentSongs = function* fetchRecentSongs() {
    try {
        const response = yield call(api.songs.find, { 'sort': 'AdditionDate', 'fields': 'thumbUrl' });
        yield put(actions.getRecentSongsSuccess(response.items));
    } catch (e) {
        console.log(e)
    }
}

const fetchLatestEvents = function* fetchLatestEvents() {
    try {
        const response = yield call(api.events.find, { 'sort': 'AdditionDate', 'fields': 'MainPicture' });
        yield put(actions.getLatestEventsSuccess(response.items));
    } catch (e) {
        console.log(e)
    }
}

const homeSaga = function* homeSagaAsync() {
    yield takeLatest(actions.getPopularSongs, fetchPopularSongs)
    yield takeLatest(actions.getRecentSongs, fetchRecentSongs)
    yield takeLatest(actions.getLatestEvents, fetchLatestEvents)
}

export { fetchPopularSongs, fetchRecentSongs }

export default homeSaga
