import { all } from 'redux-saga/effects'
import songSagas from './../modules/song/songSagas'
import albumSagas from './../modules/album/albumSagas'
import artistSagas from './../modules/artist/artistSagas'
import releaseEventSagas from './../modules/releaseEvent/releaseEventSagas'
import entrySagas from './../modules/entry/entrySagas'

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
