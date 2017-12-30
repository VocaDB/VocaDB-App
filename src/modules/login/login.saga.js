import { put, takeLatest, all, call } from 'redux-saga/effects'
import Api from './login.api'
import * as actions from './login.action'
import { LOG_IN, LOG_IN_SUCCESS } from './login.action.type'
import * as storage from './../storage/storage.action'
import * as key from './../../constants/storageKey'

const login = function* login() {
    try {
        const response = yield call(Api.auth.login);
        yield put(actions.loginSuccess(response));
    } catch (e) {
        yield put(actions.loginError(e));
    }
}

const loginSuccess = function* loginSuccess(action) {
    yield put(storage.save(key.PROFILE, action.payload.profile));
}

const loginSaga = function* loginSaga() {
    yield takeLatest(LOG_IN, login)
    yield takeLatest(LOG_IN_SUCCESS, loginSuccess)
}

export { login, loginSuccess }

export default loginSaga
