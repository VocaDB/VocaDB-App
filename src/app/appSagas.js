import { all } from 'redux-saga/effects'
import songSagas from '../features/song/songSagas'
import albumSagas from '../features/album/albumSagas'
import artistSagas from '../features/artist/artistSagas'
import releaseEventSagas from '../features/releaseEvent/releaseEventSagas'
import entrySagas from '../features/entry/entrySagas'

const rootSaga = function* rootSaga() {
    yield all([
        songSagas(),
        albumSagas(),
        artistSagas(),
        releaseEventSagas(),
        entrySagas()
    ])
}

export default rootSaga
