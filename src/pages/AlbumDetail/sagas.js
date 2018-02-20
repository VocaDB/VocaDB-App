import { put, takeLatest, call } from 'redux-saga/effects'
import * as actions from './actions'
import api from './../../api'
import * as globalActions from './../../actions'

const fetchAlbum = function* fetchAlbum(action) {
    try {
        const response = yield call(api.albums.get, action.payload.id, { 'fields': 'MainPicture,Tags,WebLinks,ReleaseEvent,Artists,PVs,Tracks' });
        yield put(actions.getAlbumSuccess(response));
    } catch (e) {
        yield put(globalActions.requestError(e));
    }
}

const albumDetailSaga = function* albumDetailSagaAsync() {
    yield takeLatest(actions.getAlbum, fetchAlbum)
}

export { fetchAlbum }

export default albumDetailSaga
