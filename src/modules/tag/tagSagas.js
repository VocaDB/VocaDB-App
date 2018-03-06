import { put, takeLatest, call } from 'redux-saga/effects'
import * as actions from './tagActions'
import * as appActions from '../../app/appActions'
import api from './tagApi'

const fetchTagDetail = function* fetchLatestTags(action) {
    try {

        if(action.payload && action.payload.id) {
            const response = yield call(api.getTag, action.payload.id);
            yield put(actions.fetchTagDetailSuccess(response));
        } else {
            yield put(appActions.requestError(new Error("id is undefined")));
        }
    } catch (e) {
        yield put(appActions.requestError(e));
    }
}

const fetchTopSongsByTag = function* fetchTopSongs(action) {
    try {
        const response = yield call(api.getTopSongsByTag, action.payload.tagId);
        yield put(actions.fetchTopSongsByTagSuccess(response.items));
    } catch (e) {
        yield put(appActions.requestError(e));
    }
}

const fetchTopArtistsByTag = function* fetchTopArtistsByTag(action) {
    try {
        const response = yield call(api.getTopArtistsByTag, action.payload.tagId);
        yield put(actions.fetchTopArtistsByTagSuccess(response.items));
    } catch (e) {
        yield put(appActions.requestError(e));
    }
}

const fetchTopAlbumsByTag = function* fetchTopAlbumsByTag(action) {
    try {
        const response = yield call(api.getTopAlbumsByTag, action.payload.tagId);
        yield put(actions.fetchTopAlbumsByTagSuccess(response.items));
    } catch (e) {
        yield put(appActions.requestError(e));
    }
}

const tagSaga = function* tagSagaAsync() {
    yield takeLatest(actions.fetchTagDetail, fetchTagDetail)
    yield takeLatest(actions.fetchTopSongsByTag, fetchTopSongsByTag)
    yield takeLatest(actions.fetchTopArtistsByTag, fetchTopArtistsByTag)
    yield takeLatest(actions.fetchTopAlbumsByTag, fetchTopAlbumsByTag)

}

export { fetchTagDetail, fetchTopSongsByTag, fetchTopArtistsByTag, fetchTopAlbumsByTag}

export default tagSaga
