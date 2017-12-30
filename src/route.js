import Home from './modules/home'
import Login from './modules/login'
import Search from './modules/search'
import Song from './modules/song'
import Profile from './modules/profile'
import Playground from './modules/playground'
import Root from './modules/root'

const route = {
    Home,
    Login,
    Search,
    Profile,
    Root,
    Playground: { screen: Playground },
    Song
}

export default route
