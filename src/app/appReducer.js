import { combineReducers } from 'redux'
import song from '../features/song/songReducer'
import album from '../features/album/albumReducer'
import artist from '../features/artist/artistReducer'
import user from '../features/user/userReducer'
import entry from '../features/entry/entryReducer'
import releaseEvent from '../features/releaseEvent/releaseEventReducer'
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
    releaseEvent,
    user,
    entry
})

export default rootReducer