import { put, takeLatest, call } from 'redux-saga/effects'
import * as actions from './actions'
import api from './../../api'
import * as globalActions from './../../actions'

const fetchArtist = function* fetchArtist(action) {
    try {
        const response = yield call(api.artists.get, action.payload.id, { 'relations': 'All', 'fields': 'Description,Tags,WebLinks' });
        yield put(actions.getArtistSuccess(response));
    } catch (e) {
        yield put(globalActions.requestError(e));
    }
}

const artistDetailSaga = function* artistDetailSagaAsync() {
    yield takeLatest(actions.getArtist, fetchArtist)
}

export { fetchArtist }

export default artistDetailSaga
