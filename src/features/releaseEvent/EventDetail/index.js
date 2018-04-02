import React from 'react'
import { connect } from 'react-redux'
import EventDetail from './EventDetail'
import { createSelector } from 'reselect';
import { fetchReleaseEventDetail, fetchPublishedSongs } from '../releaseEventActions'
import { selectReleaseEventDetail, selectPublishedSongs } from '../releaseEventSelector'
import { selectLoading } from '../../../app/appSelector'
import { Linking } from 'react-native'

EventDetail.navigationOptions = ({ navigation }) => {

    const { params } = navigation.state;

    return {
        title: params ? params.title : 'Event',
    }
}

const tagStateSelect = createSelector(
    selectReleaseEventDetail(),
    selectPublishedSongs(),
    selectLoading(),
    (event, songs, loading) => ({ event, songs, loading })
);


const mapDispatchToProps = (dispatch, props) => ({
    fetchEvent: id => dispatch(fetchReleaseEventDetail(id)),
    onPressDate: date => console.log(date),
    onPressLocation: location => console.log(location),
    onPressWebsite: url => Linking.openURL(url).catch(err => console.error('An error occurred', err))
})

export default connect(tagStateSelect, mapDispatchToProps)(EventDetail)