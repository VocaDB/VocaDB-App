import { put, takeLatest, call, select } from 'redux-saga/effects'
import * as actions from './songActions'
import * as appActions from '../../app/appActions'
import api from './songApi'
import { selectFollowedArtistIds } from './../user/userSelector'

const fetchLatestSongs = function* fetchLatestSongs() {
    try {
        const response = yield call(api.getRecentSongs);
        yield put(actions.fetchLatestSongsSuccess(response.items));
    } catch (e) {
        yield put(appActions.requestError(e));
    }
}

const fetchFollowedSongs = function* fetchFollowedSongs() {
    try {

        const artistIds = yield select(selectFollowedArtistIds())

        let results = []

        if(artistIds && artistIds.length) {
            const response = yield call(api.getFollowedSongs, artistIds);
            results = response.items;
        }

        yield put(actions.fetchFollowedSongsSuccess(results));

    } catch (e) {
        yield put(appActions.requestError(e));
    }
}

const fetchSongDetail = function* fetchLatestSongs(action) {
    try {

        if(action.payload && action.payload.id) {
            const response = yield call(api.getSong, action.payload.id);
            yield put(actions.fetchSongDetailSuccess(response));
        } else {
            yield put(appActions.requestError(new Error("id is undefined")));
        }
    } catch (e) {
        yield put(appActions.requestError(e));
    }
}

const songSaga = function* songSagaAsync() {
    yield takeLatest(actions.fetchLatestSongs, fetchLatestSongs)
    yield takeLatest(actions.fetchFollowedSongs, fetchFollowedSongs)
    yield takeLatest(actions.fetchSongDetail, fetchSongDetail)
}

export { fetchLatestSongs, fetchFollowedSongs, fetchSongDetail }

export default songSaga
