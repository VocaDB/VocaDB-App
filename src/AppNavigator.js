import HomePage from './features/main/Home'
import SongDetailPage from './features/song/SongDetail'
import ArtistDetailPage from './features/artist/ArtistDetail'
import AlbumDetailPage from './features/album/AlbumDetail'
import SearchPage from './features/entry/EntrySearch'
import SongListPage from './features/song/SongSearch'
import ArtistListPage from './features/artist/ArtistSearch'
import TagDetailPage from './features/tag/TagDetail'
import EventDetailPage from './features/releaseEvent/EventDetail'
import FollowedArtistsPage from './features/artist/FollowedArtists'
import { StackNavigator } from "react-navigation";
import Theme from './theme'

export const Page = {
    Home: 'Home',
    SongDetail: 'SongDetail',
    ArtistDetail: 'ArtistDetail',
    AlbumDetail: 'AlbumDetail',
    Search: 'Search',
    SongList: 'SongList',
    ArtistList: 'ArtistList',
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
    ArtistList: { screen: ArtistListPage },
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