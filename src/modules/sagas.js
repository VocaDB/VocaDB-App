import { all } from 'redux-saga/effects'
import homeSagas from './home/home.saga'
import searchSagas from './search/search.saga'
import storageSagas from './storage/storage.saga'
import loginSagas from './login/login.saga'
import songSagas from './song/song.saga'
import albumSagas from './album/album.saga'
import artistSagas from './artist/artist.saga'

const rootSaga = function* rootSaga() {
  yield all([
      homeSagas(),
      searchSagas(),
      storageSagas(),
      loginSagas(),
      songSagas(),
      albumSagas(),
      artistSagas()
  ])
}

export default rootSaga
