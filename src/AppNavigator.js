import MainPage from './features/main/Main'
import SongDetailPage from './features/song/SongDetail'
import SongFilterPage from './features/song/SongFilter'
import SongWithParamsPage from './features/song/SongWithParams'
import ArtistDetailPage from './features/artist/ArtistDetail'
import AlbumDetailPage from './features/album/AlbumDetail'
import AlbumSearchPage from './features/album/AlbumSearch'
import SearchPage from './features/entry/EntrySearch'
import SongListPage from './features/song/SongSearch'
import ArtistListPage from './features/artist/ArtistSearch'
import TagDetailPage from './features/tag/TagDetail'
import EventDetailPage from './features/releaseEvent/EventDetail'
import FollowedArtistsPage from './features/artist/FollowedArtists'
import EventSearchPage from './features/releaseEvent/EventSearch'
import FavoriteSongsPage from './features/song/FavoriteSongs'
import { StackNavigator } from "react-navigation";
import Theme from './theme'
import Routes from './app/appRoutes'


export const INITIAL_ROUTE = Routes.Main

const AppNavigator = StackNavigator({
    Main: { screen: MainPage },
    SongDetail: { screen: SongDetailPage },
    SongFilter: { screen: SongFilterPage },
    SongWithParams: { screen: SongWithParamsPage },
    ArtistDetail: { screen: ArtistDetailPage },
    AlbumDetail: { screen: AlbumDetailPage },
    Search: { screen: SearchPage },
    SongList: { screen: SongListPage },
    ArtistList: { screen: ArtistListPage },
    AlbumSearch: { screen: AlbumSearchPage },
    TagDetail: { screen: TagDetailPage },
    EventDetail: { screen: EventDetailPage },
    FollowedArtists: { screen: FollowedArtistsPage },
    EventSearch: { screen: EventSearchPage },
    FavoriteSongs: { screen: FavoriteSongsPage }
}, {
    initialRouteName: INITIAL_ROUTE,
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