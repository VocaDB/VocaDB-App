import { fromJS } from 'immutable';
import { combineReducers } from 'redux-immutable';
import home from './pages/Home/reducer'
import songDetail from './pages/SongDetail/reducer'
import search from './pages/Search/reducer'

const entities = (state = fromJS({}), action) => {
    if(action.payload && action.payload.entities) {
        return state.mergeDeep(action.payload.entities)
    }
    return state;
}

const rootReducers = combineReducers({
    entities,
    home,
    songDetail,
    search
})

export default rootReducers