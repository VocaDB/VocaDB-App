import { put, takeLatest, call, select } from 'redux-saga/effects'
import * as actions from './releaseEventActions'
import * as appActions from '../../app/appActions'
import api from './releaseEventApi'
import { selectSearchParams } from './releaseEventSelector'

const fetchSearchEvents = function* fetchSearchEvents() {
    try {
        const params = yield select(selectSearchParams())
        const response = yield call(api.find, params);
        let append = (params.start) ? true : false
        yield put(actions.fetchSearchEventsSuccess(response.items, append));
    } catch (e) {
        yield put(appActions.requestError(e));
    }
}

const fetchLatestReleaseEvents = function* fetchLatestReleaseEvents() {
    try {
        const response = yield call(api.getRecentReleaseEvents);
        yield put(actions.fetchLatestReleaseEventsSuccess(response.items));
    } catch (e) {
        yield put(appActions.requestError(e));
    }
}

const fetchReleaseEventDetail = function* fetchLatestReleaseEvents(action) {
    try {

        if(action.payload && action.payload.id) {
            const response = yield call(api.getReleaseEvent, action.payload.id);
            yield put(actions.fetchReleaseEventDetailSuccess(response));
        } else {
            yield put(appActions.requestError(new Error("id is undefined")));
        }
    } catch (e) {
        yield put(appActions.requestError(e));
    }
}

const releaseEventSaga = function* releaseEventSagaAsync() {
    yield takeLatest(actions.fetchLatestReleaseEvents, fetchLatestReleaseEvents)
    yield takeLatest(actions.fetchReleaseEventDetail, fetchReleaseEventDetail)
    yield takeLatest(actions.fetchSearchEvents, fetchSearchEvents)
}

export { fetchSearchEvents, fetchLatestReleaseEvents, fetchReleaseEventDetail }

export default releaseEventSaga
