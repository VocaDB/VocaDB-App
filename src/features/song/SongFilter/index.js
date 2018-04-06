import React from 'react'
import { connect } from 'react-redux'
import SongFilterPage from './SongFilter'
import { createSelector } from 'reselect';
import * as songActions from '../songActions'
import { selectSearchParams, selectFilterArtists, selectFilterTags } from '../songSelector'

SongFilterPage.navigationOptions = ({ navigation }) => {

    const { params } = navigation.state;

    const navOptions = {
        title: params ? params.title : 'Filter',
    }

    if(params && params.hideHeader) {
        navOptions.header = null
    }

    return navOptions
}

const songListStateSelect = createSelector(
    selectSearchParams(),
    selectFilterArtists(),
    (params, filterArtists, filterTags) => ({ params, filterArtists, filterTags })
);


const mapDispatchToProps = (dispatch, props) => ({
    onFilterChanged: (params, remove) => dispatch(songActions.fetchSearchSongs(params, remove)),
    back: () => props.navigation.goBack()
})

export default connect(songListStateSelect, mapDispatchToProps)(SongFilterPage)