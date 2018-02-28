import HomePage from './pages/Home'
import SongDetailPage from './pages/SongDetail'
import ArtistDetailPage from './pages/ArtistDetail'
import AlbumDetailPage from './pages/AlbumDetail'
import SearchPage from './pages/Search'
import SongListPage from './pages/SongList'
import TagDetailPage from './pages/TagDetail'
import EventDetailPage from './pages/EventDetail'
import FollowedArtistsPage from './pages/FollowedArtists'
import { StackNavigator } from "react-navigation";
import Theme from './theme'

export const Page = {
    Home: 'Home',
    SongDetail: 'SongDetail',
    ArtistDetail: 'ArtistDetail',
    AlbumDetail: 'AlbumDetail',
    Search: 'Search',
    SongList: 'SongList',
    TagDetail: 'TagDetail',
    EventDetail: 'EventDetail',
    FollowedArtists: 'FollowedArtists'
}

const AppNavigator = StackNavigator({
    Home: { screen: HomePage },
    SongDetail: { screen: SongDetailPage },
    ArtistDetail: { screen: ArtistDetailPage },
    AlbumDetail: { screen: AlbumDetailPage },
    Search: { screen: SearchPage },
    SongList: { screen: SongListPage },
    TagDetail: { screen: TagDetailPage },
    EventDetail: { screen: EventDetailPage },
    FollowedArtists: { screen: FollowedArtistsPage }
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