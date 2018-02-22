import { put, takeLatest, call } from 'redux-saga/effects'
import * as actions from './actions'
import api from './../../api'
import * as globalActions from './../../actions'

const fetchEvent = function* fetchEvent(action) {
    try {
        const response = yield call(api.events.get, action.payload.id, {});
        console.log('get event')
        console.log(response)
        yield put(actions.getEventSuccess(response));
    } catch (e) {
        yield put(globalActions.requestError(e));
    }
}

const eventDetailSaga = function* eventDetailSagaAsync() {
    yield takeLatest(actions.getEvent, fetchEvent)

}

export { fetchEvent }

export default eventDetailSaga
