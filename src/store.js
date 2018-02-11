import { createStore, applyMiddleware } from 'redux'
import rootReducers from './reducer'
import thunkMiddleware from 'redux-thunk'
import loggerMiddleware from 'redux-logger'
import createSagaMiddleware from 'redux-saga'
import saga from './sagas'

const sagaMiddleware = createSagaMiddleware()

const store = createStore(
    rootReducers,
    applyMiddleware(
        loggerMiddleware,
        thunkMiddleware,
        sagaMiddleware)
)

sagaMiddleware.run(saga)

export default store
