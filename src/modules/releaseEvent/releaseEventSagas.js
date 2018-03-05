import { put, takeLatest, call, select } from 'redux-saga/effects'
import * as actions from './releaseEventActions'
import * as appActions from '../../app/appActions'
import api from './releaseEventApi'
import { selectFollowedArtistIds } from './../user/userSelector'

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
}

export { fetchLatestReleaseEvents, fetchReleaseEventDetail }

export default releaseEventSaga
