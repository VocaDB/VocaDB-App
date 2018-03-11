import { put, takeLatest, call, select } from 'redux-saga/effects'
import * as actions from './artistActions'
import * as appActions from '../../app/appActions'
import api from './artistApi'

const fetchSearchArtists = function* fetchSearchArtists(action) {
    try {
        const params = action.payload.params
        const response = yield call(api.find, params);
        let append = (params.start) ? true : false
        yield put(actions.fetchSearchArtistsSuccess(response.items, append));
    } catch (e) {
        yield put(appActions.requestError(e));
    }
}

const fetchArtistDetail = function* fetchLatestArtists(action) {
    try {

        if(action.payload && action.payload.id) {
            const response = yield call(api.getArtist, action.payload.id);
            yield put(actions.fetchArtistDetailSuccess(response));
        } else {
            yield put(appActions.requestError(new Error("id is undefined")));
        }
    } catch (e) {
        yield put(appActions.requestError(e));
    }
}

const artistSaga = function* artistSagaAsync() {
    yield takeLatest(actions.fetchArtistDetail, fetchArtistDetail)
    yield takeLatest(actions.fetchSearchArtists, fetchSearchArtists)
}

export { fetchArtistDetail, fetchSearchArtists }

export default artistSaga
