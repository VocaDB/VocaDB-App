import HomePage from './pages/Home'
import SongDetailPage from './pages/SongDetail'
import { StackNavigator } from "react-navigation";


const Root = StackNavigator({
    Home: { screen: HomePage },
    SongDetail: { screen: SongDetailPage }
})


export default Root;