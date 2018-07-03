import React from 'react'
import { connect } from 'react-redux'
import SongWithParams from './SongWithParams'
import { createSelector } from 'reselect';
import * as songActions from '../songActions'
import { selectSelectedSinglePageResults, selectSelectedSinglePageParams } from '../songSelector'
import { selectLoading } from '../../../app/appSelector'
import Routes from './../../../app/appRoutes'

SongWithParams.navigationOptions = ({ navigation }) => {

    const { params } = navigation.state;

    const navOptions = {
        title: params ? params.title : 'Songs',
    }

    if(params.hideHeader) {
        navOptions.header = null
    }

    return navOptions
}

const mapStateSelect = createSelector(
    selectSelectedSinglePageResults(),
    selectSelectedSinglePageParams(),
    selectLoading(),
    (songs, params, loading, isNoResult) => ({ songs, params, loading })
);


const mapDispatchToProps = (dispatch, props) => ({
    fetchSongs: (pageId, params) => dispatch(songActions.addParamsToPageId(pageId, params)),
    fetchMoreSongs: pageId => dispatch(songActions.fetchMoreResultOnPageId(pageId)),
    back: () => props.navigation.goBack(),
    onPressSong: song => props.navigation.navigate(Routes.SongDetail, { id: song.id })
})

export default connect(mapStateSelect, mapDispatchToProps)(SongWithParams)