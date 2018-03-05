import { put, takeLatest, call } from 'redux-saga/effects'
import * as actions from './tagActions'
import * as appActions from '../../app/appActions'
import api from './tagApi'

const fetchTagDetail = function* fetchLatestTags(action) {
    try {

        if(action.payload && action.payload.id) {
            const response = yield call(api.getTag, action.payload.id);
            yield put(actions.fetchTagDetailSuccess(response));
        } else {
            yield put(appActions.requestError(new Error("id is undefined")));
        }
    } catch (e) {
        yield put(appActions.requestError(e));
    }
}

const tagSaga = function* tagSagaAsync() {
    yield takeLatest(actions.fetchTagDetail, fetchTagDetail)
}

export { fetchTagDetail }

export default tagSaga
