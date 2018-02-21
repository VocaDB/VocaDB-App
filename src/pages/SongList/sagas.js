import { put, takeLatest, call } from 'redux-saga/effects'
import * as actions from './actions'
import * as globalActions from './../../actions'
import api from './../../api'

const fetchSongs = function* fetchSongs(action) {
    try {
        const params = action.payload.params
        const response = yield call(api.songs.find, params);
        yield put(actions.getSongsSuccess(response.items));
    } catch (e) {
        yield put(globalActions.requestError(e));
    }
}

const songListSaga = function* songListSaga() {
    yield takeLatest(actions.getSongs, fetchSongs)
}

export { fetchSongs }

export default songListSaga
