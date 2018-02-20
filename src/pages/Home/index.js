import React from 'react'
import { connect } from 'react-redux'
import HomePage from './component'
import * as actions from './actions'
import { createSelector } from 'reselect';
import { Button } from 'react-native'
import Icon from './../../components/Icon'
import { selectRecentSongs, selectPopularSongs, selectLatestEvents, selecrRefreshing, selectRecentAlbums } from './selector'
import { COLOR } from 'react-native-material-ui';

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
    (recentSongs, popularSongs, refreshing, latestEvents, recentAlbums) => ({ recentSongs, popularSongs, refreshing, latestEvents, recentAlbums })
);

const mapDispatchToProps = (dispatch, props) => ({
    fetchRecentSongs: () => dispatch(actions.getRecentSongs()),
    fetchPopularSongs: () => dispatch(actions.getPopularSongs()),
    fetchLatestEvents: () => dispatch(actions.getLatestEvents()),
    fetchRecentAlbums: () => dispatch(actions.getRecentAlbums()),
    onPressSong: song => props.navigation.navigate('SongDetail', { id: song.id }),
    onPressAlbum: album => props.navigation.navigate('AlbumDetail', { id: album.id })
})

export default connect(homeStateSelect, mapDispatchToProps)(HomePage)