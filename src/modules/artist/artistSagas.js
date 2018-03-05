import { put, takeLatest, call, select } from 'redux-saga/effects'
import * as actions from './artistActions'
import * as appActions from '../../app/appActions'
import api from './artistApi'

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
}

export { fetchArtistDetail }

export default artistSaga
