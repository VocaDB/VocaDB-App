import { combineReducers } from 'redux'
import home from './home/home.reducer'
import login from './login/login.reducer'
import search from './search/search.reducer'
import song from './song/song.reducer'
import album from './album/album.reducer'
import profile from './profile/profile.reducer'
import artist from './artist/artist.reducer'
import nav from './nav'

const rootReducers = combineReducers({
    login,
    home,
    nav,
    search,
    song,
    profile,
    artist,
    album
})

export default rootReducers
