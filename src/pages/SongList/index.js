import React from 'react'
import { connect } from 'react-redux'
import SongListPage from './component'
import { createSelector } from 'reselect';
import * as actions from './actions'
import { selectRefreshing, selectSongs } from './selector'

SongListPage.navigationOptions = ({ navigation }) => {

    const { params } = navigation.state;

    return {
        title: params ? params.title : 'Songs',
    }
}

const songListStateSelect = createSelector(
    selectSongs(),
    selectRefreshing(),
    (songs, refreshing) => ({ songs, refreshing })
);


const mapDispatchToProps = (dispatch, props) => ({
    fetchSongs: params => dispatch(actions.getSongs(params)),
    onPressSong: song => props.navigation.navigate('SongDetail', { id: song.id }),
})

export default connect(songListStateSelect, mapDispatchToProps)(SongListPage)