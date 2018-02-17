import React from 'react'
import { connect } from 'react-redux'
import HomePage from './component'
import * as actions from './actions'
import { createSelector } from 'reselect';
import { selectRecentSongs, selectPopularSongs, selectLatestEvents, selecrRefreshing, selectRecentAlbums } from './selector'

HomePage.navigationOptions = () => ({
    title: 'Home',
    drawerLabel: 'Home',
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
    onPressSong: id => props.navigation.navigate('SongDetail', { id })
})

export default connect(homeStateSelect, mapDispatchToProps)(HomePage)