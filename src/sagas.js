import { all } from 'redux-saga/effects'
import homeSagas from './pages/Home/sagas'
import songDetailSagas from './pages/SongDetail/sagas'
import artistDetailSagas from './pages/ArtistDetail/sagas'
import albumDetailSagas from './pages/AlbumDetail/sagas'
import searchSagas from './pages/Search/sagas'

const rootSaga = function* rootSaga() {
    yield all([
        homeSagas(),
        songDetailSagas(),
        artistDetailSagas(),
        albumDetailSagas(),
        searchSagas()
    ])
}

export default rootSaga
