import { fromJS } from 'immutable';
import { combineReducers } from 'redux'

import home from './pages/Home/reducer'
import songDetail from './pages/SongDetail/reducer'
import artistDetail from './pages/ArtistDetail/reducer'
import albumDetail from './pages/AlbumDetail/reducer'
import songList from './pages/SongList/reducer'
import tagDetail from './pages/TagDetail/reducer'
import eventDetail from './pages/EventDetail/reducer'
import search from './pages/Search/reducer'
import user from './modules/user/userReducer'
import song from './modules/song/songReducer'
import app from './app/appReducer'

const entities = (state = {}, action) => {
    if(action.payload && action.payload.entities) {
        const entities = action.payload.entities;
        return { ...entities }
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
    // home,
    // songDetail,
    // artistDetail,
    // albumDetail,
    // search,
    songList,
    // tagDetail,
    // eventDetail,
    //
    // user,
    song,
    app
})

export default rootReducers