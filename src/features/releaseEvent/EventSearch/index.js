import React from 'react'
import { connect } from 'react-redux'
import EventSearch from './EventSearch'
import { createSelector } from 'reselect';
import * as eventActions from '../releaseEventActions'
import { selectSearchResult, selectSearchParams, selectNoResult } from '../releaseEventSelector'
import { selectLoading } from '../../../app/appSelector'
import Routes from './../../../app/appRoutes'

EventSearch.navigationOptions = ({ navigation }) => {

    const { params } = navigation.state;

    const navOptions = {
        title: params ? params.title : 'Songs',
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
    (events, params, loading, isNoResult) => ({ events, params, loading, isNoResult })
);


const mapDispatchToProps = (dispatch, props) => ({
    fetchEvents: params => dispatch(eventActions.fetchSearchEvents(params)),
    fetchEventsReplaceParams: params => dispatch(eventActions.fetchSearchEvents(params, false, true)),
    back: () => props.navigation.goBack(),
    onPressEvent: event => props.navigation.navigate(Routes.EventDetail, { id: event.id })
})

export default connect(mapStateSelector, mapDispatchToProps)(EventSearch)