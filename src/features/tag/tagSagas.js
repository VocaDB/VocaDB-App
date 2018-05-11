import { put, takeLatest, call, select, all } from 'redux-saga/effects'
import * as actions from './tagActions'
import * as appActions from '../../app/appActions'
import api from './tagApi'
import { selectTagDetailId } from './tagSelector'
import { selectDisplayLanguage } from './../user/userSelector'

const fetchTagDetail = function* fetchLatestTags() {
    try {
        const displayLanguage = yield select(selectDisplayLanguage())
        const tagId = yield select(selectTagDetailId());

        if(!tagId) return;

        const [detailResponse, topSongs, topArtists, topAlbums] = yield all([
            call(api.getTag, tagId, { lang: displayLanguage }),
            call(api.getTopSongsByTag, tagId, { lang: displayLanguage }),
            call(api.getTopArtistsByTag, tagId, { lang: displayLanguage }),
            call(api.getTopAlbumsByTag, tagId, { lang: displayLanguage }),
        ])

        if(!detailResponse) {
            yield put(appActions.requestError(new Error("No response from server")));
            return;
        }

        if(topSongs && topSongs.items) {
            detailResponse.topSongs = topSongs.items;
        }

        if(topArtists && topArtists.items) {
            detailResponse.topArtists = topArtists.items;
        }

        if(topAlbums && topAlbums.items) {
            detailResponse.topAlbums = topAlbums.items;
        }

        yield put(actions.fetchTagDetailSuccess(detailResponse));

    } catch (e) {
        yield put(appActions.requestError(e));
    }
}

const fetchTopSongsByTag = function* fetchTopSongs(action) {
    try {
        const response = yield call(api.getTopSongsByTag, action.payload.tagId);
        yield put(actions.fetchTopSongsByTagSuccess(response.items));
    } catch (e) {
        yield put(appActions.requestError(e));
    }
}

const fetchTopArtistsByTag = function* fetchTopArtistsByTag(action) {
    try {
        const response = yield call(api.getTopArtistsByTag, action.payload.tagId);
        yield put(actions.fetchTopArtistsByTagSuccess(response.items));
    } catch (e) {
        yield put(appActions.requestError(e));
    }
}

const fetchTopAlbumsByTag = function* fetchTopAlbumsByTag(action) {
    try {
        const response = yield call(api.getTopAlbumsByTag, action.payload.tagId);
        yield put(actions.fetchTopAlbumsByTagSuccess(response.items));
    } catch (e) {
        yield put(appActions.requestError(e));
    }
}

const searchTags = function* searchTags(action) {
    try {
        const params = action.payload.params;

        if(!params) return;

        const displayLanguage = yield select(selectDisplayLanguage())
        const response = yield call(api.find, { ...params, lang: displayLanguage });

        if(params.start) {
            yield put(actions.appendTagsSearchResult(response.items));
        } else {
            yield put(actions.addTagsSearchResult(response.items));
        }

    } catch (e) {
        yield put(appActions.requestError(e));
    }
}

const tagSaga = function* tagSagaAsync() {
    yield takeLatest(actions.fetchTagDetail, fetchTagDetail)
    yield takeLatest(actions.searchTags, searchTags)
}

export { fetchTagDetail, fetchTopSongsByTag, fetchTopArtistsByTag, fetchTopAlbumsByTag, searchTags }

export default tagSaga
