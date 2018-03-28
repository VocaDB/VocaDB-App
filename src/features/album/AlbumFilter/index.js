import React from 'react'
import { connect } from 'react-redux'
import AlbumFilterPage from './AlbumFilter'
import { createSelector } from 'reselect';
import * as albumActions from '../albumActions'
import { selectSearchParams, selectFilterArtists } from '../albumSelector'

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
    (params, filterArtists) => ({ params, filterArtists })
);


const mapDispatchToProps = (dispatch, props) => ({
    onFilterChanged: (params, remove) => dispatch(albumActions.fetchSearchAlbums(params, remove)),
    back: () => props.navigation.goBack()
})

export default connect(albumListStateSelect, mapDispatchToProps)(AlbumFilterPage)