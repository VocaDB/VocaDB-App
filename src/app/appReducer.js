import { combineReducers } from 'redux'
import song from '../modules/song/songReducer'
import album from '../modules/album/albumReducer'
import artist from '../modules/artist/artistReducer'
import releaseEvent from '../modules/releaseEvent/releaseEventReducer'
import merge from "lodash/merge";

const error = (state = false, action) => (action.error)? action.error : false
const loading = (state = false, action) => (action.payload && action.payload.loading)? true : false
const entities = (state = {}, action) => {
    if(action.payload && action.payload.entities) {
        return merge({}, state, action.payload.entities);
    }
    return state;
}

const rootReducer = combineReducers({
    error,
    loading,
    entities,
    song,
    album,
    artist,
    releaseEvent
})

export default rootReducer