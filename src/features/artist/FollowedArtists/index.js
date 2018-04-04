import React from 'react'
import { connect } from 'react-redux'
import FollowedArtists from './FollowedArtists'
import { selectFollowedArtists, selectFollowedArtistIds } from './../artistSelector'
import { createSelector } from 'reselect';

FollowedArtists.navigationOptions = ({ navigation }) => {

    const { params } = navigation.state;

    return {
        title: params ? params.title : 'Followed artists',
    }
}

const mapStateSelector =  createSelector(
    selectFollowedArtists(),
    selectFollowedArtistIds(),
    (followedArtists, ids) => ({ followedArtists, ids })
)

const mapStateToProps = (state) => ({
    followedArtists: []
})

const mapDispatchToProps = (dispatch, props) => ({
    onPressArtist: artist => props.navigation.navigate('ArtistDetail', { id: artist.id }),
})

export default connect(mapStateSelector, mapDispatchToProps)(FollowedArtists)