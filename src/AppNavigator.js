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
import AlbumFilterPage from './features/album/AlbumFilter'
import ArtistFilterPage from './features/artist/ArtistFilter'
import FavoriteAlbumsPage from './features/album/FavoriteAlbums'
import SignInPage from './features/user/SignIn'
import MyAlbumsPage from './features/user/MyAlbums'
import SettingsPage from './features/user/Settings'
import TagSearchPage from './features/tag/TagSearch'
import { StackNavigator } from "react-navigation";
import Theme from './theme'
import Routes from './app/appRoutes'
import config from './common/constants/config'


export const INITIAL_ROUTE = (config.enableAuth)? Routes.SignIn : Routes.Main

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
    FavoriteSongs: { screen: FavoriteSongsPage },
    AlbumFilter: { screen: AlbumFilterPage },
    ArtistFilter: { screen: ArtistFilterPage },
    FavoriteAlbums: { screen: FavoriteAlbumsPage },
    SignIn: { screen: SignInPage },
    MyAlbums: { screen: MyAlbumsPage },
    Settings: { screen: SettingsPage },
    TagSearch: { screen: TagSearchPage }
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