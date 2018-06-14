import React from 'react'
import { connect } from 'react-redux'
import EventFilterPage from './EventFilter'
import { createSelector } from 'reselect';
import * as eventActions from '../releaseEventActions'
import { selectSearchParams, selectFilterArtists, selectFilterTags } from '../releaseEventSelector'

EventFilterPage.navigationOptions = ({ navigation }) => {

    const { params } = navigation.state;

    const navOptions = {
        title: params ? params.title : 'Filter',
    }

    if(params && params.hideHeader) {
        navOptions.header = null
    }

    return navOptions
}

const mapStateSelector = createSelector(
    selectSearchParams(),
    selectFilterArtists(),
    selectFilterTags(),
    (params, filterArtists, filterTags) => ({ params, filterArtists, filterTags })
);


const mapDispatchToProps = (dispatch, props) => ({
    onFilterChanged: (params, remove) => dispatch(eventActions.fetchSearchEvents(params, remove)),
    onParamChanged: (name, value) => dispatch(eventActions.updateSearchParams(name, value)),
    onAddArtist: (artist) => dispatch(eventActions.addSearchParamsArray('artistId', artist.id)),
    onRemoveArtist: (artist) => dispatch(eventActions.removeSearchParamsArray('artistId', artist.id)),
    onAddFilterTag: tag =>  dispatch(eventActions.addSearchParamsArray('tagId', tag.id)),
    onRemoveFilterTag: tag => dispatch(eventActions.removeSearchParamsArray('tagId', tag.id)),
    back: () => props.navigation.goBack()
})

export default connect(mapStateSelector, mapDispatchToProps)(EventFilterPage)