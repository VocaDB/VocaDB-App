import React from 'react';
import { connect } from 'react-redux';
import AlbumSearch from './AlbumSearch';
import { createSelector } from 'reselect';
import * as albumActions from '../albumActions';
import { selectSearchResult, selectSearchParams, selectNoResult } from '../albumSelector';
import { selectLoading } from '../../../app/appSelector';
import Routes from './../../../app/appRoutes';
import i18n from './../../../common/i18n';

AlbumSearch.navigationOptions = ({ navigation }) => {

    const { params } = navigation.state;

    const navOptions = {
        title: params ? params.title : i18n.albums,
    }

    if(params && params.hideHeader) {
        navOptions.header = null;
    }

    return navOptions;
}

const mapStateSelector = createSelector(
    selectSearchResult(),
    selectSearchParams(),
    selectLoading(),
    selectNoResult(),
    (albums, params, loading, isNoResult) => ({ albums, params, loading, isNoResult })
);


const mapDispatchToProps = (dispatch, props) => ({
    fetchAlbums: () => dispatch(albumActions.fetchSearchAlbums()),
    fetchMoreAlbums: () => dispatch(albumActions.fetchMoreSearchResult()),
    onSearch: (value) => dispatch(albumActions.onSearching(value)),
    back: () => props.navigation.goBack(),
    onPressAlbum: album => props.navigation.navigate(Routes.AlbumDetail, { id: album.id }),
    onPressFilter: () => props.navigation.navigate(Routes.AlbumFilter)
})

export default connect(mapStateSelector, mapDispatchToProps)(AlbumSearch)