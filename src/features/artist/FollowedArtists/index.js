import React from 'react'
import { connect } from 'react-redux'
import FollowedArtists from './FollowedArtists'
import { createSelector } from 'reselect';

FollowedArtists.navigationOptions = ({ navigation }) => {

    const { params } = navigation.state;

    return {
        title: params ? params.title : 'Followed artists',
    }
}

const mapStateToProps = (state) => ({
    followedArtists: []
})

const mapDispatchToProps = (dispatch, props) => ({
    onPressArtist: artist => props.navigation.navigate('ArtistDetail', { id: artist.id }),
})

export default connect(mapStateToProps, mapDispatchToProps)(FollowedArtists)