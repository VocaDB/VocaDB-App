import HomePage from './pages/Home'
import MainPage from './pages/Main'
import SongDetailPage from './pages/SongDetail'
import SearchPage from './pages/Search'
import { StackNavigator } from "react-navigation";


const AppNavigator = StackNavigator({
    Home: { screen: HomePage },
    SongDetail: { screen: SongDetailPage },
    Search: { screen: SearchPage }
}, {
    initialRouteName: 'Search'
})


export default AppNavigator;