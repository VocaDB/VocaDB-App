import { put, takeLatest, call, select } from 'redux-saga/effects'
import { delay } from 'redux-saga'
import * as actions from './albumActions'
import * as appActions from '../../app/appActions'
import api from './albumApi'
import { selectSearchParams, selectSelectedSinglePageParams, selectSelectedNavRoute } from './albumSelector'
import { selectDisplayLanguage } from './../user/userSelector'

const fetchSearchAlbums = function* fetchSearchAlbums() {
    try {
        const params = yield select(selectSearchParams())
        const displayLanguage = yield select(selectDisplayLanguage())

        yield call(delay, 500)

        const response = yield call(api.find, { ...params, lang: displayLanguage });

        if(params && params.start) {
            yield put(actions.addSearchResult(response.items));
        } else {
            yield put(actions.setSearchResult(response.items));
        }

    } catch (e) {
        yield put(appActions.requestError(e));
    }
}

const fetchTopAlbums = function* fetchTopAlbums() {
    try {
        const displayLanguage = yield select(selectDisplayLanguage())
        const response = yield call(api.getTopAlbums, { languagePreference: displayLanguage });
        yield put(actions.fetchTopAlbumsSuccess(response));
    } catch (e) {
        yield put(appActions.requestError(e));
    }
}

const fetchLatestAlbums = function* fetchLatestAlbums() {
    try {
        const displayLanguage = yield select(selectDisplayLanguage())
        const response = yield call(api.getRecentAlbums, { languagePreference: displayLanguage });
        yield put(actions.fetchLatestAlbumsSuccess(response));
    } catch (e) {
        yield put(appActions.requestError(e));
    }
}

const fetchAlbumDetail = function* fetchLatestAlbums(action) {
    try {

        if(action.payload && action.payload.id) {
            const displayLanguage = yield select(selectDisplayLanguage())
            const response = yield call(api.getAlbum, action.payload.id, { lang: displayLanguage });
            yield put(actions.fetchAlbumDetailSuccess(response));
        } else {
            yield put(appActions.requestError(new Error("id is undefined")));
        }
    } catch (e) {
        yield put(appActions.requestError(e));
    }
}

const fetchAlbumsFromSelectedPageParams = function* fetchAlbumsFromSelectedPageParams() {
    try {
        const params = yield select(selectSelectedSinglePageParams())
        const displayLanguage = yield select(selectDisplayLanguage())
        const route = yield select(selectSelectedNavRoute())

        yield call(delay, 500)

        const response = yield call(api.find, { ...params, lang: displayLanguage });

        if(params && params.start) {
            yield put(actions.addResultToPageId(route.key,response.items));
        } else {
            yield put(actions.setResultToPageId(route.key,response.items));
        }

    } catch (e) {
        yield put(appActions.requestError(e));
    }
}

const albumSaga = function* albumSagaAsync() {
    yield takeLatest([
        actions.fetchSearchAlbums,
        actions.onSearching,
        actions.updateSearchParams,
        actions.removeSearchParamsArray,
        actions.addSearchParamsArray,
        actions.fetchMoreSearchResult,
        actions.addFilterTag,
        actions.removeFilterTag], fetchSearchAlbums)

    yield takeLatest(actions.fetchLatestAlbums, fetchLatestAlbums)
    yield takeLatest(actions.fetchTopAlbums, fetchTopAlbums)
    yield takeLatest(actions.fetchAlbumDetail, fetchAlbumDetail)

    yield takeLatest([
        actions.addParamsToPageId,
        actions.fetchMoreResultOnPageId
    ], fetchAlbumsFromSelectedPageParams)
}

export { fetchSearchAlbums, fetchTopAlbums, fetchLatestAlbums, fetchAlbumDetail }

export default albumSaga
