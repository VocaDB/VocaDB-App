import { put, takeLatest, call } from 'redux-saga/effects'
import * as actions from './actions'
import SampleSong from './../../sample/song'
import api from './../../api'

const fetchSong = function* fetchSong(action) {
    try {
        const response = yield call(api.songs.get, action.payload.id, { 'fields': ['ThumbUrl', 'Albums', 'Artists', 'Tags', 'WebLinks', 'PVs'].join(',') });
        console.log(response)
        yield put(actions.getSongSuccess(response));
    } catch (e) {
        console.log(e)
    }
}

const songDetailSaga = function* songDetailSagaAsync() {
    yield takeLatest(actions.getSong, fetchSong)
}

export { fetchSong }

export default songDetailSaga
