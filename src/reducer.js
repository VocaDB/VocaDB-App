import { fromJS } from 'immutable';
import { combineReducers } from 'redux-immutable';
import home from './pages/Home/reducer'
import songDetail from './pages/SongDetail/reducer'
import artistDetail from './pages/ArtistDetail/reducer'
import search from './pages/Search/reducer'

const entities = (state = fromJS({}), action) => {
    if(action.payload && action.payload.entities) {
        return state.mergeDeep(action.payload.entities)
    }
    return state;
}

const error = (state = false, action) => {
    if(action.error) {
        alert(action.payload)
        return action.payload
    }
    return false
}

const rootReducers = combineReducers({
    error,
    entities,
    home,
    songDetail,
    artistDetail,
    search
})

export default rootReducers