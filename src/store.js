import { createStore, applyMiddleware } from 'redux'
import rootReducers from './modules/reducers'
import thunkMiddleware from 'redux-thunk'
import loggerMiddleware from 'redux-logger'
import createSagaMiddleware from 'redux-saga'
import rootSaga from './modules/sagas'

const sagaMiddleware = createSagaMiddleware()

const store = createStore(
  rootReducers,
  applyMiddleware(
    thunkMiddleware,
    sagaMiddleware)
)

sagaMiddleware.run(rootSaga)

export default store
