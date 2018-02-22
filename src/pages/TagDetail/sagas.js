import { put, takeLatest, call } from 'redux-saga/effects'
import * as actions from './actions'
import api from './../../api'
import * as globalActions from './../../actions'

const fetchTag = function* fetchSong(action) {
    try {
        const response = yield call(api.tags.get, action.payload.id, {});
        console.log(response)
        yield put(actions.getTagSuccess(response));
    } catch (e) {
        yield put(globalActions.requestError(e));
    }
}

const fetchTopSongs = function* fetchSong(action) {
    try {
        const params = { 'maxResults': 20, 'fields': 'thumbUrl' , 'tagId': action.payload.tagId}
        const response = yield call(api.songs.find, params);
        yield put(actions.getTopSongsSuccess(response.items));
    } catch (e) {
        yield put(globalActions.requestError(e));
    }
}

const fetchTopArtists = function* fetchTopArtists(action) {
    try {
        const params = { 'maxResults': 20, 'fields': 'MainPicture', 'tagId': action.payload.tagId}
        const response = yield call(api.artists.find, params);
        yield put(actions.getTopArtistsSuccess(response.items));
    } catch (e) {
        yield put(globalActions.requestError(e));
    }
}

const fetchTopAlbums = function* fetchTopAlbums(action) {
    try {
        const params = { 'maxResults': 20, 'fields': 'MainPicture', 'tagId': action.payload.tagId}
        const response = yield call(api.albums.find, params);
        yield put(actions.getTopAlbumsSuccess(response.items));
    } catch (e) {
        yield put(globalActions.requestError(e));
    }
}

const tagDetailSaga = function* tagDetailSagaAsync() {
    yield takeLatest(actions.getTag, fetchTag)
    yield takeLatest(actions.getTopSongs, fetchTopSongs)
    yield takeLatest(actions.getTopArtists, fetchTopArtists)
    yield takeLatest(actions.getTopAlbums, fetchTopAlbums)

}

export { fetchTag, fetchTopSongs, fetchTopArtists, fetchTopAlbums }

export default tagDetailSaga
