import { all } from 'redux-saga/effects'
import homeSagas from './pages/Home/sagas'
import songDetailSagas from './pages/SongDetail/sagas'

const rootSaga = function* rootSaga() {
    yield all([
        homeSagas(),
        songDetailSagas()
    ])
}

export default rootSaga
