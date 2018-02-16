import React from 'react'
import { connect } from 'react-redux'
import HomePage from './component'
import * as actions from './actions'
import { createSelector } from 'reselect';
import { selectRecentSongs, selectPopularSongs, selecrRefreshing } from './selector'

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
    (recentSongs, popularSongs, refreshing) => ({ recentSongs, popularSongs, refreshing })
);

const mapDispatchToProps = (dispatch, props) => ({
    fetchRecentSongs: () => dispatch(actions.getRecentSongs()),
    fetchPopularSongs: () => dispatch(actions.getPopularSongs()),
    onPressSong: id => props.navigation.navigate('SongDetail', { id })
})

export default connect(homeStateSelect, mapDispatchToProps)(HomePage)