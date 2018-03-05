import { put, takeLatest, call, select } from 'redux-saga/effects'
import { selectFollowedArtists } from '../../modules/user/userSelector'
import * as actions from './actions'
import * as globalActions from './../../actions'
import api from './../../api'

const fetchPopularSongs = function* fetchPopularSongs() {
    try {
        const response = yield call(api.songs.find, { 'sort': 'FavoritedTimes', 'fields': 'thumbUrl' });
        yield put(actions.getPopularSongsSuccess(response.items));
    } catch (e) {
        yield put(globalActions.requestError(e));
    }
}

const fetchRecentSongs = function* fetchRecentSongs() {
    try {
        const response = yield call(api.songs.find, { 'sort': 'AdditionDate', 'fields': 'thumbUrl' });
        yield put(actions.getRecentSongsSuccess(response.items));
    } catch (e) {
        yield put(globalActions.requestError(e));
    }
}

const fetchLatestEvents = function* fetchLatestEvents() {
    try {
        const response = yield call(api.events.find, { 'sort': 'AdditionDate', 'fields': 'MainPicture' });
        yield put(actions.getLatestEventsSuccess(response.items));
    } catch (e) {
        yield put(globalActions.requestError(e));
    }
}

const fetchRecentAlbums = function* fetchRecentAlbums() {
    try {
        const response = yield call(api.albums.find, { 'sort': 'AdditionDate' });
        yield put(actions.getRecentAlbumsSuccess(response.items));
    } catch (e) {
        yield put(globalActions.requestError(e));
    }
}

const fetchFollowedSongs = function* fetchFollowedSongs(action) {
    try {
        let artistIds = yield select(selectFollowedArtists())

        artistIds = artistIds.toList().toJS().map(a => a.id)

        if(artistIds.length) {
            const response = yield call(api.songs.find, { 'sort': 'AdditionDate', 'fields': 'thumbUrl', 'artistId': artistIds });
            yield put(actions.getFollowedSongsSuccess(response.items));
        } else {
            yield put(actions.getFollowedSongsSuccess([]));
        }


    } catch (e) {
        yield put(globalActions.requestError(e));
    }
}


const homeSaga = function* homeSagaAsync() {
    yield takeLatest(actions.getPopularSongs, fetchPopularSongs)
    yield takeLatest(actions.getRecentSongs, fetchRecentSongs)
    yield takeLatest(actions.getLatestEvents, fetchLatestEvents)
    yield takeLatest(actions.getRecentAlbums, fetchRecentAlbums)
    yield takeLatest(actions.getFollowedSongs, fetchFollowedSongs)
}

export { fetchPopularSongs, fetchRecentSongs }

export default homeSaga
