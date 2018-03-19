import MainPage from './features/main/Main'
import SongDetailPage from './features/song/SongDetail'
import SongFilterPage from './features/song/SongFilter'
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
    Main: 'Main',
    SongDetail: 'SongDetail',
    ArtistDetail: 'ArtistDetail',
    AlbumDetail: 'AlbumDetail',
    Search: 'Search',
    SongList: 'SongList',
    SongFilter: 'SongFilter',
    ArtistList: 'ArtistList',
    TagDetail: 'TagDetail',
    EventDetail: 'EventDetail',
    FollowedArtists: 'FollowedArtists'
}

export const INITIAL_ROUTE = Page.Main

const AppNavigator = StackNavigator({
    Main: { screen: MainPage },
    SongDetail: { screen: SongDetailPage },
    SongFilter: { screen: SongFilterPage },
    ArtistDetail: { screen: ArtistDetailPage },
    AlbumDetail: { screen: AlbumDetailPage },
    Search: { screen: SearchPage },
    SongList: { screen: SongListPage },
    ArtistList: { screen: ArtistListPage },
    TagDetail: { screen: TagDetailPage },
    EventDetail: { screen: EventDetailPage },
    FollowedArtists: { screen: FollowedArtistsPage }
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