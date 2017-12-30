import { put, take, all, call } from 'redux-saga/effects'
import * as actions from './storage.action'
import * as actionTypes from './storage.action.type'
import { AsyncStorage } from 'react-native'

const storageSave = function* storageSave(action) {
    try {
        if(action.payload.key) {
            yield call(AsyncStorage.setItem, action.payload.key ,action.payload.value);
            yield put(actions.saveSuccess(action.payload.key, action.payload.value));
        } else {
            yield put(actions.error(new Error('Undefined key')));
        }
    } catch (e) {
        yield put(actions.error(e));
    }
}

const storageGet = function* storageGet(action) {
    try {
        if(action.payload.key) {
            const response = yield call(AsyncStorage.getItem, action.payload.key);
            yield put(actions.getSuccess(response));
        } else {
            yield put(actions.error(new Error('Undefined key')));
        }
    } catch (e) {
        yield put(actions.error(e));
    }
}

const storageSaga = function* storageSaga() {
    yield take(actionTypes.SAVE, storageSave)
    yield take(actionTypes.GET, storageGet)
}

export { storageSave, storageGet }

export default storageSaga
