import { put, takeLatest, call } from 'redux-saga/effects'
import Api from './../../api'
import * as actions from './search.action'
import * as actionTypes from './search.action.type'

const searchEntry = function* searchEntry(action) {
    try {
        const response = yield call(Api.entries.find, { 'query': action.payload.query, 'fields': 'MainPicture' });
        yield put(actions.entrySuccess(response.items));
    } catch (e) {
        yield put(actions.entryError(e));
    }
}

const searchSaga = function* searchSaga() {
    yield takeLatest(actionTypes.ENTRY_REQUEST, searchEntry)
}

export { searchEntry }

export default searchSaga
