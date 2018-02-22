import { all } from 'redux-saga/effects'
import homeSagas from './pages/Home/sagas'
import songDetailSagas from './pages/SongDetail/sagas'
import artistDetailSagas from './pages/ArtistDetail/sagas'
import albumDetailSagas from './pages/AlbumDetail/sagas'
import songListSagas from './pages/SongList/sagas'
import searchSagas from './pages/Search/sagas'
import tagDetailSagas from './pages/TagDetail/sagas'
import eventDetailSagas from './pages/EventDetail/sagas'

const rootSaga = function* rootSaga() {
    yield all([
        homeSagas(),
        songDetailSagas(),
        songListSagas(),
        artistDetailSagas(),
        albumDetailSagas(),
        searchSagas(),
        tagDetailSagas(),
        eventDetailSagas()
    ])
}

export default rootSaga
