import { put, takeLatest } from 'redux-saga/effects'
import * as actions from './actions'
import SampleSong from './../../sample/song'

const fetchSong = function* fetchSong() {
    yield put(actions.getSongSuccess(SampleSong));
}

const songDetailSaga = function* songDetailSagaAsync() {
    yield takeLatest(actions.getSong, fetchSong)
}

export { fetchSong }

export default songDetailSaga
