import React from 'react'
import { connect } from 'react-redux'
import SongListPage from './component'
import { createSelector } from 'reselect';
import * as songActions from './../../modules/song/songActions'
import { selectSearchResult, selectSearchParams, selectNoResult } from './../../modules/song/songSelector'
import { selectLoading } from '../../app/appSelector'


SongListPage.modalVisible = true

SongListPage.navigationOptions = ({ navigation }) => {

    const { params } = navigation.state;

    const navOptions = {
        title: params ? params.title : 'Songs',
    }

    if(params.hideHeader) {
        navOptions.header = null
    }

    return navOptions
}

const songListStateSelect = createSelector(
    selectSearchResult(),
    selectSearchParams(),
    selectLoading(),
    selectNoResult(),
    (songs, params, loading, isNoResult) => ({ songs, params, loading, isNoResult })
);


const mapDispatchToProps = (dispatch, props) => ({
    fetchSongs: params => dispatch(songActions.fetchSearchSongs(params)),
    back: () => props.navigation.goBack(),
    onPressSong: song => props.navigation.navigate('SongDetail', { id: song.id }),
    onPressTag: tag => props.navigation.navigate('TagDetail', { id: tag.id })
})

export default connect(songListStateSelect, mapDispatchToProps)(SongListPage)