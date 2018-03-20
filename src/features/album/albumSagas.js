import { put, takeLatest, call, select } from 'redux-saga/effects'
import * as actions from './albumActions'
import * as appActions from '../../app/appActions'
import api from './albumApi'
import { selectSearchParams } from './albumSelector'

const fetchSearchAlbums = function* fetchSearchAlbums() {
    try {
        const params = yield select(selectSearchParams())
        const response = yield call(api.find, params);
        let append = (params.start) ? true : false
        yield put(actions.fetchSearchAlbumsSuccess(response.items, append));
    } catch (e) {
        yield put(appActions.requestError(e));
    }
}

const fetchTopAlbums = function* fetchTopAlbums() {
    try {
        const response = yield call(api.getTopAlbums);
        yield put(actions.fetchTopAlbumsSuccess(response));
    } catch (e) {
        yield put(appActions.requestError(e));
    }
}

const fetchLatestAlbums = function* fetchLatestAlbums() {
    try {
        const response = yield call(api.getRecentAlbums);
        yield put(actions.fetchLatestAlbumsSuccess(response));
    } catch (e) {
        yield put(appActions.requestError(e));
    }
}

const fetchAlbumDetail = function* fetchLatestAlbums(action) {
    try {

        if(action.payload && action.payload.id) {
            const response = yield call(api.getAlbum, action.payload.id);
            yield put(actions.fetchAlbumDetailSuccess(response));
        } else {
            yield put(appActions.requestError(new Error("id is undefined")));
        }
    } catch (e) {
        yield put(appActions.requestError(e));
    }
}

const albumSaga = function* albumSagaAsync() {
    yield takeLatest(actions.fetchSearchAlbums, fetchSearchAlbums)
    yield takeLatest(actions.fetchLatestAlbums, fetchLatestAlbums)
    yield takeLatest(actions.fetchTopAlbums, fetchTopAlbums)
    yield takeLatest(actions.fetchAlbumDetail, fetchAlbumDetail)
}

export { fetchSearchAlbums, fetchTopAlbums, fetchLatestAlbums, fetchAlbumDetail }

export default albumSaga
