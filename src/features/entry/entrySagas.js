import { put, takeLatest, call, select } from 'redux-saga/effects'
import { delay } from 'redux-saga'
import * as actions from './entryActions'
import api from './entryApi'
import * as appActions from '../../app/appActions'
import { selectDisplayLanguage } from './../user/userSelector'

const searchEntries = function* searchEntries(action) {
    try {
        yield call(delay, 500)
        const displayLanguage = yield select(selectDisplayLanguage())
        const response = yield call(api.search, action.payload.query, { lang: displayLanguage });
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
