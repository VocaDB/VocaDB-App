import React from 'react'
import { connect } from 'react-redux'
import SongListPage from './SongSearch'
import { createSelector } from 'reselect';
import * as songActions from '../songActions'
import { selectSearchResult, selectSearchParams, selectNoResult } from '../songSelector'
import { selectLoading } from '../../../app/appSelector'
import { Page } from './../../../AppNavigator'

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
    fetchSongsReplaceParams: params => dispatch(songActions.fetchSearchSongs(params, false, true)),
    back: () => props.navigation.goBack(),
    onPressSong: song => props.navigation.navigate(Page.SongDetail, { id: song.id }),
    onPressFilter: () => props.navigation.navigate(Page.SongFilter)
})

export default connect(songListStateSelect, mapDispatchToProps)(SongListPage)