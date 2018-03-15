import { createStore, applyMiddleware } from 'redux'
import rootReducers from './appReducer'
import thunkMiddleware from 'redux-thunk'
import loggerMiddleware from 'redux-logger'
import { navMiddleware } from './AppWithNavigationState'
import createSagaMiddleware from 'redux-saga'
import saga from './appSagas'



const sagaMiddleware = createSagaMiddleware()

const store = createStore(
    rootReducers,
    applyMiddleware(
        loggerMiddleware,
        navMiddleware,
        thunkMiddleware,
        sagaMiddleware)
)

sagaMiddleware.run(saga)

export default store
