import HomePage from './pages/Home'
import SongDetailPage from './pages/SongDetail'
import ArtistDetailPage from './pages/ArtistDetail'
import SearchPage from './pages/Search'
import { StackNavigator } from "react-navigation";
import { primaryColor } from './theme'


const AppNavigator = StackNavigator({
    Home: { screen: HomePage },
    SongDetail: { screen: SongDetailPage },
    ArtistDetail: { screen: ArtistDetailPage },
    Search: { screen: SearchPage }
}, {
    initialRouteName: 'Home',
    navigationOptions: {
        headerStyle: {
            backgroundColor: primaryColor,
        },
        headerTintColor: '#fff',
        headerTitleStyle: {
            fontWeight: 'bold',
        },
    },
})


export default AppNavigator;