import { put, takeEvery, takeLatest, call, select, all } from 'redux-saga/effects'
import * as actions from './releaseEventActions'
import * as appActions from '../../app/appActions'
import api from './releaseEventApi'
import { selectSearchParams } from './releaseEventSelector'
import { selectDisplayLanguage } from './../user/userSelector'

const fetchSearchEvents = function* fetchSearchEvents() {
    try {
        const params = yield select(selectSearchParams())
        const displayLanguage = yield select(selectDisplayLanguage())
        const response = yield call(api.find, { ...params, lang: displayLanguage });
        let append = (params.start) ? true : false
        yield put(actions.fetchSearchEventsSuccess(response.items, append));
    } catch (e) {
        yield put(appActions.requestError(e));
    }
}

const fetchLatestReleaseEvents = function* fetchLatestReleaseEvents() {
    try {
        const displayLanguage = yield select(selectDisplayLanguage())
        const response = yield call(api.getRecentReleaseEvents, { lang: displayLanguage });

        yield put(actions.fetchLatestReleaseEventsSuccess(response.items));
    } catch (e) {
        yield put(appActions.requestError(e));
    }
}

const fetchReleaseEventDetail = function* fetchReleaseEventDetail(action) {
    try {

        if(action.payload && action.payload.id) {
            const displayLanguage = yield select(selectDisplayLanguage())
            const [detailResponse, songsResponse, albumsResponse] = yield all([
                call(api.getReleaseEvent, action.payload.id, { lang: displayLanguage }),
                call(api.getPublishedSongs, action.payload.id, { lang: displayLanguage }),
                call(api.getAlbums, action.payload.id, { lang: displayLanguage })
            ])

            detailResponse.songs = (songsResponse) ? songsResponse : [];
            detailResponse.albums = (albumsResponse) ? albumsResponse : [];

            if(detailResponse.songList && detailResponse.songList.id) {
                const songListSongs = yield call(api.getSongList, detailResponse.songList.id);
                detailResponse.songList.songs = (songListSongs && songListSongs.items)? songListSongs.items : [];
            }

            yield put(actions.fetchReleaseEventDetailSuccess(detailResponse));
        } else {
            yield put(appActions.requestError(new Error("id is undefined")));
        }
    } catch (e) {
        yield put(appActions.requestError(e));
    }
}

const fetchReleaseEventPublishedSongs = function* fetchReleaseEventPublishedSongs(action) {
    try {
        if(action.payload && action.payload.id) {
            const response = yield call(api.getPublishedSongs, action.payload.id);
            yield put(actions.fetchReleaseEventPublishedSongsSuccess(response));
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

export { fetchSearchEvents, fetchLatestReleaseEvents, fetchReleaseEventDetail, fetchReleaseEventPublishedSongs }

export default releaseEventSaga
