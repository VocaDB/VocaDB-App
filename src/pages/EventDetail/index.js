import React from 'react'
import { connect } from 'react-redux'
import EventDetailPage from './component'
import { createSelector } from 'reselect';
import * as actions from './actions'
import { selectLoading, selectEvent } from './selector'

EventDetailPage.navigationOptions = ({ navigation }) => {

    const { params } = navigation.state;

    return {
        title: params ? params.title : 'Event',
    }
}

const tagStateSelect = createSelector(
    selectEvent(),
    selectLoading(),
    (event, loading) => ({ event, loading })
);


const mapDispatchToProps = (dispatch, props) => ({
    fetchEvent: id => dispatch(actions.getEvent(id)),
})

export default connect(tagStateSelect, mapDispatchToProps)(EventDetailPage)