import React from 'react'
import { connect } from 'react-redux'
import AlbumSearch from './AlbumSearch'
import { createSelector } from 'reselect';
import * as albumActions from '../albumActions'
import { selectSearchResult, selectSearchParams, selectNoResult } from '../albumSelector'
import { selectLoading } from '../../../app/appSelector'
import { Page } from './../../../AppNavigator'

AlbumSearch.navigationOptions = ({ navigation }) => {

    const { params } = navigation.state;

    const navOptions = {
        title: params ? params.title : 'Albums',
    }

    if(params.hideHeader) {
        navOptions.header = null
    }

    return navOptions
}

const mapStateSelector = createSelector(
    selectSearchResult(),
    selectSearchParams(),
    selectLoading(),
    selectNoResult(),
    (albums, params, loading, isNoResult) => ({ albums, params, loading, isNoResult })
);


const mapDispatchToProps = (dispatch, props) => ({
    onSearch: text => dispatch(albumActions.fetchSearchAlbums({ query: text, start: 0 })),
    back: () => props.navigation.goBack(),
    onPressAlbum: album => props.navigation.navigate(Page.AlbumDetail, { id: album.id })
})

export default connect(mapStateSelector, mapDispatchToProps)(AlbumSearch)