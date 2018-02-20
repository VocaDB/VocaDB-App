import { put, takeLatest, call } from 'redux-saga/effects'
import * as actions from './actions'
import api from './../../api'
import * as globalActions from './../../actions'

const fetchSong = function* fetchSong(action) {
    try {
        const response = yield call(api.songs.get, action.payload.id, { 'fields': ['ThumbUrl', 'Albums', 'Artists', 'Tags', 'WebLinks', 'PVs'].join(',') });
        yield put(actions.getSongSuccess(response));
    } catch (e) {
        yield put(globalActions.requestError(e));
    }
}

const songDetailSaga = function* songDetailSagaAsync() {
    yield takeLatest(actions.getSong, fetchSong)
}

export { fetchSong }

export default songDetailSaga
