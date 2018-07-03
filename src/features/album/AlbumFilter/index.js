import React from 'react'
import { connect } from 'react-redux'
import AlbumFilterPage from './AlbumFilter'
import { createSelector } from 'reselect';
import * as albumActions from '../albumActions'
import { selectSearchParams, selectFilterArtists, selectFilterTags } from '../albumSelector'

AlbumFilterPage.navigationOptions = ({ navigation }) => {

    const { params } = navigation.state;

    const navOptions = {
        title: params ? params.title : 'Filter',
    }

    if(params && params.hideHeader) {
        navOptions.header = null
    }

    return navOptions
}

const albumListStateSelect = createSelector(
    selectSearchParams(),
    selectFilterArtists(),
    selectFilterTags(),
    (params, filterArtists, filterTags) => ({ params, filterArtists, filterTags })
);


const mapDispatchToProps = (dispatch, props) => ({
    onFilterChanged: (params, remove) => dispatch(albumActions.fetchSearchArtists(params, remove)),
    onParamChanged: (name, value) => dispatch(albumActions.updateSearchParams(name, value)),
    onAddArtist: (artist) => dispatch(albumActions.addSearchParamsArray('artistId', artist.id)),
    onRemoveArtist: (artist) => dispatch(albumActions.removeSearchParamsArray('artistId', artist.id)),
    onAddFilterTag: tag =>  dispatch(albumActions.addSearchParamsArray('tagId', tag.id)),
    onRemoveFilterTag: tag => dispatch(albumActions.removeSearchParamsArray('tagId', tag.id)),
    back: () => props.navigation.goBack()
})

export default connect(albumListStateSelect, mapDispatchToProps)(AlbumFilterPage)