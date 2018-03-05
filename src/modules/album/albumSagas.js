import { put, takeLatest, call, select } from 'redux-saga/effects'
import * as actions from './albumActions'
import * as appActions from '../../app/appActions'
import api from './albumApi'
import { selectFollowedArtistIds } from './../user/userSelector'

const fetchLatestAlbums = function* fetchLatestAlbums() {
    try {
        const response = yield call(api.getRecentAlbums);
        yield put(actions.fetchLatestAlbumsSuccess(response.items));
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
    yield takeLatest(actions.fetchLatestAlbums, fetchLatestAlbums)
    yield takeLatest(actions.fetchAlbumDetail, fetchAlbumDetail)
}

export { fetchLatestAlbums, fetchAlbumDetail }

export default albumSaga
