import { put, takeLatest, call, select } from 'redux-saga/effects'
import { delay } from 'redux-saga'
import * as actions from './userActions'
import * as appActions from '../../app/appActions'
import api from './userApi'
import { AsyncStorage } from 'react-native'
import { authKey } from './../../common/constants/storageKey'
import { selectUserId } from './userSelector'

const signIn = function* signIn(action) {
    try {
        const payload = action.payload;

        if(!payload.username && !payload.password) {
            yield put(appActions.requestError(new Error('Invalid username and password')));
            return;
        }

        yield put(appActions.showLoading());

        const { username, password } = payload;
        const response = yield call(api.signIn, username, password);

        if(!response || !response.token) {
            yield put(appActions.requestError(new Error('Something wrong, please try again later')));
        }

        AsyncStorage.setItem(authKey.token, response.token);

        yield put(actions.signInSuccess(response.token));
        yield put(actions.resetAction());

    } catch (e) {
        yield put(appActions.requestError(e));
    }
}

const fetchAlbums = function* fetchAlbums() {
    try {
        const userId = yield select(selectUserId());

        if(!userId) {
            yield put(actions.resetToSignIn());
            return;
        }

        const response = yield call(api.albums, userId)

        yield put(actions.updateAlbums(response.items));

    } catch(e) {
        yield put(appActions.requestError(e));
    }
}

const userSaga = function* userSagAsync() {
    yield takeLatest(actions.signIn, signIn)
    yield takeLatest(actions.fetchAlbums, fetchAlbums)
}

export { signIn, fetchAlbums }

export default userSaga
