import { put, takeLatest, call } from 'redux-saga/effects'
import { delay } from 'redux-saga'
import * as actions from './entryActions'
import api from './entryApi'
import * as appActions from '../../app/appActions'

const searchEntries = function* searchEntries(action) {
    try {
        yield call(delay, 500)
        const response = yield call(api.search, action.payload.query);
        yield put(actions.searchEntriesSuccess(response.items));
    } catch (e) {
        yield put(appActions.requestError(e));
    }
}

const entrySaga = function* entrySagaAsync() {
    yield takeLatest(actions.searchEntries, searchEntries)
}

export { searchEntries }

export default entrySaga
