import { all } from 'redux-saga/effects'
import homeSagas from './pages/Home/sagas'
import songDetailSagas from './pages/SongDetail/sagas'
import searchSagas from './pages/Search/sagas'

const rootSaga = function* rootSaga() {
    yield all([
        homeSagas(),
        songDetailSagas(),
        searchSagas()
    ])
}

export default rootSaga
