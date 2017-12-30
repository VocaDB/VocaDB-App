import { put, takeLatest, all, call } from 'redux-saga/effects'
import Api from './search.api'
import * as actions from './search.action'
import { ENTRY_REQUEST } from './search.action.type'

const searchEntry = function* searchEntry() {
    try {
        const response = yield call(Api.entry.list);
        yield put(actions.entrySuccess(response.items));
    } catch (e) {
        yield put(actions.entryError(e));
    }
}

const searchSaga = function* searchSaga() {
    yield takeLatest(ENTRY_REQUEST, searchEntry)
}

export default searchSaga
