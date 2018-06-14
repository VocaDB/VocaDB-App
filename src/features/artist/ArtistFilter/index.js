import React from 'react'
import { connect } from 'react-redux'
import ArtistFilterPage from './ArtistFilter'
import { createSelector } from 'reselect';
import * as artistActions from '../artistActions'
import { selectSearchParams, selectFilterTags } from '../artistSelector'

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
    selectFilterTags(),
    (params, filterTags) => ({ params, filterTags })
);


const mapDispatchToProps = (dispatch, props) => ({
    onFilterChanged: (params, remove) => dispatch(artistActions.fetchSearchArtists(params, remove)),
    onParamChanged: (name, value) => dispatch(artistActions.updateSearchParams(name, value)),
    onAddFilterTag: tag =>  dispatch(artistActions.addSearchParamsArray('tagId', tag.id)),
    onRemoveFilterTag: tag => dispatch(artistActions.removeSearchParamsArray('tagId', tag.id)),
    back: () => props.navigation.goBack()
})

export default connect(artistListStateSelect, mapDispatchToProps)(ArtistFilterPage)