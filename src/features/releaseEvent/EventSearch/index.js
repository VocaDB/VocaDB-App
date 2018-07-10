import React from 'react';
import { connect } from 'react-redux';
import EventSearch from './EventSearch';
import { createSelector } from 'reselect';
import * as eventActions from '../releaseEventActions';
import { selectSearchResult, selectSearchParams, selectNoResult } from '../releaseEventSelector';
import { selectLoading } from '../../../app/appSelector';
import Routes from './../../../app/appRoutes';
import i18n from './../../../common/i18n';

EventSearch.navigationOptions = ({ navigation }) => {

    const { params } = navigation.state;

    const navOptions = {
        title: params ? params.title : i18n.events,
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
    fetchEvent: () => dispatch(eventActions.fetchSearchEvents()),
    fetchMoreEvent: () => dispatch(eventActions.fetchMoreSearchResult()),
    onSearch: (value) => dispatch(eventActions.onSearching(value)),
    back: () => props.navigation.goBack(),
    onPressEvent: event => props.navigation.navigate(Routes.EventDetail, { id: event.id, title: event.name }),
    onPressFilter: () => props.navigation.navigate(Routes.EventFilter)
})

export default connect(mapStateSelector, mapDispatchToProps)(EventSearch)