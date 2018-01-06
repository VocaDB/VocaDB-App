import { put, takeLatest, take, all, call } from 'redux-saga/effects'
import Api from './../../api'
import * as actions from './search.action'
import * as actionTypes from './search.action.type'
import * as key from './../../constants/storageKey'
import { AsyncStorage } from 'react-native'
import {prependEntries} from "./search.utils";

const searchEntry = function* searchEntry(action) {
    try {
        const response = yield call(Api.entries.find, { 'query': action.payload.query, 'fields': 'MainPicture' });
        yield put(actions.entrySuccess(response.items));
    } catch (e) {
        yield put(actions.entryError(e));
    }
}

const saveRecent = function* saveRecent(action) {

    try {
        let recentList = yield call(AsyncStorage.getItem, key.RECENT_SEARCH);

        if(recentList) {
            recentList = JSON.parse(recentList);
        }

        let newEntry = action.payload.newEntry
        let newRecentList = prependEntries(recentList, newEntry)

        yield call(AsyncStorage.setItem, key.RECENT_SEARCH ,JSON.stringify(newRecentList));
        yield put(actions.saveRecentSuccess(newRecentList));

    } catch (e) {
        yield put(actions.saveRecentError(e));
    }
}

const readRecent = function* readRecent() {
    try {
        let recentList = yield call(AsyncStorage.getItem, key.RECENT_SEARCH);
        yield put(actions.readRecentSuccess(JSON.parse(recentList)));
    } catch (e) {
        yield put(actions.readRecentError(e));
    }
}

const searchSaga = function* searchSaga() {
    yield takeLatest(actionTypes.ENTRY_REQUEST, searchEntry)
    yield takeLatest(actionTypes.SAVE_RECENT, saveRecent)
    yield takeLatest(actionTypes.READ_RECENT, readRecent)
}

export { searchEntry, saveRecent, readRecent }

export default searchSaga
