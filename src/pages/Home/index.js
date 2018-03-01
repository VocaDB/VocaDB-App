import React from 'react'
import { connect } from 'react-redux'
import HomePage from './component'
import * as actions from './actions'
import { createSelector } from 'reselect';
import { Button } from 'react-native'
import Icon from './../../components/Icon'
import { selectRecentSongs, selectPopularSongs, selectLatestEvents, selecrRefreshing, selectRecentAlbums, selectFollowedSongs } from './selector'
import { selectUser, selectFollowedArtists } from './../../modules/user/selector'
import { Page } from './../../AppNavigator'

HomePage.navigationOptions = ({ navigation }) => ({
    title: 'Home',
    drawerLabel: 'Home',
    headerRight: (
        <Icon name='ios-search' color='white' onPress={() => navigation.navigate('Search')} />
    ),
})

HomePage.propTypes = {

}

const homeStateSelect = createSelector(
    selectRecentSongs(),
    selectPopularSongs(),
    selecrRefreshing(),
    selectLatestEvents(),
    selectRecentAlbums(),
    selectFollowedSongs(),
    (recentSongs, popularSongs, refreshing, latestEvents, recentAlbums, followedSongs) => ({
        recentSongs,
        popularSongs,
        refreshing,
        latestEvents,
        recentAlbums,
        followedSongs
    })
);
 
const mapDispatchToProps = (dispatch, props) => ({
    fetchRecentSongs: () => dispatch(actions.getRecentSongs()),
    fetchPopularSongs: () => dispatch(actions.getPopularSongs()),
    fetchLatestEvents: () => dispatch(actions.getLatestEvents()),
    fetchRecentAlbums: () => dispatch(actions.getRecentAlbums()),
    fetchFollowedSongs: () => dispatch(actions.getFollowedSongs([4])),
    onPressSong: song => props.navigation.navigate(Page.SongDetail, { id: song.id }),
    onPressAlbum: album => props.navigation.navigate(Page.AlbumDetail, { id: album.id }),
    onPressEvent: event => props.navigation.navigate(Page.SongDetail, { id: event.id, title: event.name }),
    onPressMoreRecentSongs: () => props.navigation.navigate(Page.SongList, {
        title: 'Recent songs',
        params: {
            'maxResults': 20,
            'sort': 'AdditionDate',
            'fields': 'thumbUrl'
        }
    }),
    onPressMenuFollowArtists: () => props.navigation.navigate(Page.FollowedArtists)
})

export default connect(homeStateSelect, mapDispatchToProps)(HomePage)