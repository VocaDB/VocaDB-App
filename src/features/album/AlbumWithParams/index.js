import React from 'react'
import { connect } from 'react-redux'
import AlbumWithParams from './AlbumWithParams'
import { createSelector } from 'reselect';
import * as albumActions from '../albumActions'
import { selectSelectedSinglePageResults, selectSelectedSinglePageParams } from '../albumSelector'
import { selectLoading } from '../../../app/appSelector'
import Routes from './../../../app/appRoutes'

AlbumWithParams.navigationOptions = ({ navigation }) => {

    const { params } = navigation.state;

    const navOptions = {
        title: params ? params.title : 'Albums',
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
    (albums, params, loading) => ({ albums, params, loading })
);


const mapDispatchToProps = (dispatch, props) => ({
    fetchAlbums: (pageId, params) => dispatch(albumActions.addParamsToPageId(pageId, params)),
    fetchMoreAlbums: pageId => dispatch(albumActions.fetchMoreResultOnPageId(pageId)),
    back: () => props.navigation.goBack(),
    onPressAlbum: album => props.navigation.navigate(Routes.AlbumDetail, { id: album.id })
})

export default connect(mapStateSelect, mapDispatchToProps)(AlbumWithParams)