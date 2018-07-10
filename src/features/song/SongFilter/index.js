import React from 'react';
import { connect } from 'react-redux';
import SongFilterPage from './SongFilter';
import { createSelector } from 'reselect';
import * as songActions from '../songActions';
import { selectSearchParams, selectFilterArtists, selectFilterTags } from '../songSelector';
import i18n from './../../../common/i18n';

SongFilterPage.navigationOptions = ({ navigation }) => {

    const { params } = navigation.state;

    const navOptions = {
        title: params ? params.title : i18n.filter,
    }

    if(params && params.hideHeader) {
        navOptions.header = null;
    }

    return navOptions;
}

const songListStateSelect = createSelector(
    selectSearchParams(),
    selectFilterArtists(),
    selectFilterTags(),
    (params, filterArtists, filterTags) => ({ params, filterArtists, filterTags })
);

const mapDispatchToProps = (dispatch, props) => ({
    onFilterChanged: (params, remove) => dispatch(songActions.fetchSearchSongs(params, remove)),
    onParamChanged: (namve, value) => dispatch(songActions.updateSearchParams(namve, value)),
    onAddArtist: (artist) => dispatch(songActions.addSearchParamsArray('artistId', artist.id)),
    onRemoveArtist: (artist) => dispatch(songActions.removeSearchParamsArray('artistId', artist.id)),
    onAddFilterTag: tag =>  dispatch(songActions.addSearchParamsArray('tagId', tag.id)),
    onRemoveFilterTag: tag => dispatch(songActions.removeSearchParamsArray('tagId', tag.id)),
    back: () => props.navigation.goBack()
})

export default connect(songListStateSelect, mapDispatchToProps)(SongFilterPage)