import { put, takeLatest, call, select } from 'redux-saga/effects'
import { delay } from 'redux-saga'
import * as actions from './songActions'
import * as appActions from '../../app/appActions'
import * as artistActions from '../artist/artistActions'
import api from './songApi'
import { selectFollowedArtistIds } from './../artist/artistSelector'
import { selectSearchParams, selectRankingState } from './songSelector'
import { selectDisplayLanguage } from './../user/userSelector'

const fetchHighlighted = function* fetchHighlighted() {
    try {
        const displayLanguage = select(selectDisplayLanguage())
        const response = yield call(api.highlighted, { languagePreference: displayLanguage });
        yield put(actions.fetchHighlightedSuccess(response));
    } catch (e) {
        yield put(appActions.requestError(e));
    }
}

const fetchSearchSongs = function* fetchSearchSongs() {
    try {
        const params = yield select(selectSearchParams())
        yield call(delay, 500)
        const response = yield call(api.find, params);
        let append = (params && params.start) ? true : false
        yield put(actions.fetchSearchSongsSuccess(response.items, append));
    } catch (e) {
        yield put(appActions.requestError(e));
    }
}

const fetchLatestSongs = function* fetchLatestSongs() {
    try {
        const response = yield call(api.getRecentSongs);
        yield put(actions.fetchLatestSongsSuccess(response.items));
    } catch (e) {
        yield put(appActions.requestError(e));
    }
}

const fetchFollowedSongs = function* fetchFollowedSongs() {
    try {

        const artistIds = yield select(selectFollowedArtistIds())

        let results = []

        if(artistIds && artistIds.length) {
            const response = yield call(api.getFollowedSongs, artistIds);
            results = response.items;
        }

        yield put(actions.fetchFollowedSongsSuccess(results));

    } catch (e) {
        yield put(appActions.requestError(e));
    }
}

const fetchSongDetail = function* fetchLatestSongs(action) {
    try {

        if(action.payload && action.payload.id) {
            const response = yield call(api.getSong, action.payload.id);
            yield put(actions.fetchSongDetailSuccess(response));
        } else {
            yield put(appActions.requestError(new Error("id is undefined")));
        }
    } catch (e) {
        yield put(appActions.requestError(e));
    }
}

const fetchRanking = function* fetchRanking() {
    try {

        const rankingState = yield select(selectRankingState())

        if(!rankingState) {
            return;
        }

        const response = yield call(api.getTopRated, {
            durationHours: (rankingState.durationHours === 0)? null : rankingState.durationHours,
            filterBy: rankingState.filterBy,
            vocalist: (rankingState.vocalist === 'All')? null : rankingState.vocalist
        });

        yield put(actions.updateRankingResult(response));

    } catch (e) {
        yield put(appActions.requestError(e));
    }
}

const songSaga = function* songSagaAsync() {
    yield takeLatest(actions.fetchHighlighted, fetchHighlighted)
    yield takeLatest(actions.fetchLatestSongs, fetchLatestSongs)
    yield takeLatest(actions.fetchFollowedSongs, fetchFollowedSongs)
    yield takeLatest(artistActions.followArtist, fetchFollowedSongs)
    yield takeLatest(artistActions.unFollowArtist, fetchFollowedSongs)
    yield takeLatest(actions.fetchSongDetail, fetchSongDetail)
    yield takeLatest([actions.fetchSearchSongs,
    actions.addSelectedFilterTag,
    actions.removeSelectedFilterTag], fetchSearchSongs)
    yield takeLatest([actions.changeDurationHours,
        actions.changeFilterBy,
        actions.changeVocalist], fetchRanking)
}

export { fetchHighlighted, fetchSearchSongs, fetchLatestSongs, fetchFollowedSongs, fetchSongDetail, fetchRanking }

export default songSaga
