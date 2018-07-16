import { put, takeLatest, call, select } from 'redux-saga/effects'
import { delay } from 'redux-saga'
import * as actions from './artistActions'
import * as appActions from '../../app/appActions'
import api from './artistApi'
import { selectSearchParams } from './artistSelector'
import { selectDisplayLanguage } from './../user/userSelector'

const fetchSearchArtists = function* fetchSearchArtists() {
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

const fetchArtistDetail = function* fetchLatestArtists(action) {
    try {

        if(action.payload && action.payload.id) {
            const displayLanguage = yield select(selectDisplayLanguage())
            const response = yield call(api.getArtist, action.payload.id, { lang: displayLanguage });
            yield put(actions.fetchArtistDetailSuccess(response));
        } else {
            yield put(appActions.requestError(new Error("id is undefined")));
        }
    } catch (e) {
        yield put(appActions.requestError(e));
    }
}

const artistSaga = function* artistSagaAsync() {
    yield takeLatest(actions.fetchArtistDetail, fetchArtistDetail)
    yield takeLatest([
        actions.fetchSearchArtists,
        actions.onSearching,
        actions.updateSearchParams,
        actions.removeSearchParamsArray,
        actions.addSearchParamsArray,
        actions.fetchMoreSearchResult,
        actions.addFilterTag,
        actions.removeFilterTag,
        actions.clearFilter], fetchSearchArtists)
}

export { fetchArtistDetail, fetchSearchArtists }

export default artistSaga
