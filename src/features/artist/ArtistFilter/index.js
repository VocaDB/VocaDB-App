import React from 'react'
import { connect } from 'react-redux'
import ArtistFilterPage from './ArtistFilter'
import { createSelector } from 'reselect';
import * as artistActions from '../artistActions'
import { selectSearchParams } from '../artistSelector'

ArtistFilterPage.navigationOptions = ({ navigation }) => {

    const { params } = navigation.state;

    const navOptions = {
        title: params ? params.title : 'Filter',
    }

    if(params && params.hideHeader) {
        navOptions.header = null
    }

    return navOptions
}

const artistListStateSelect = createSelector(
    selectSearchParams(),
    (params) => ({ params })
);


const mapDispatchToProps = (dispatch, props) => ({
    onFilterChanged: (params, remove) => dispatch(artistActions.fetchSearchArtists(params, remove)),
    back: () => props.navigation.goBack()
})

export default connect(artistListStateSelect, mapDispatchToProps)(ArtistFilterPage)