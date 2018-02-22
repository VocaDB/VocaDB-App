import HomePage from './pages/Home'
import SongDetailPage from './pages/SongDetail'
import ArtistDetailPage from './pages/ArtistDetail'
import AlbumDetailPage from './pages/AlbumDetail'
import SearchPage from './pages/Search'
import SongListPage from './pages/SongList'
import TagDetailPage from './pages/TagDetail'
import { StackNavigator } from "react-navigation";
import Theme from './theme'


const AppNavigator = StackNavigator({
    Home: { screen: HomePage },
    SongDetail: { screen: SongDetailPage },
    ArtistDetail: { screen: ArtistDetailPage },
    AlbumDetail: { screen: AlbumDetailPage },
    Search: { screen: SearchPage },
    SongList: { screen: SongListPage },
    TagDetail: { screen: TagDetailPage }
}, {
    initialRouteName: 'Home',
    navigationOptions: {
        headerStyle: {
            backgroundColor: Theme.primaryColor,
        },
        headerTintColor: '#fff',
        headerTitleStyle: {
            fontWeight: 'bold',
        },
    },
})


export default AppNavigator;