import React from 'react'
import { connect } from 'react-redux'
import FollowedArtistsPage from './component'
import { createSelector } from 'reselect';
import { selectFollowedArtistsAsArray } from './../../modules/user/selector'

FollowedArtistsPage.navigationOptions = ({ navigation }) => {

    const { params } = navigation.state;

    return {
        title: params ? params.title : 'Followed artists',
    }
}

const followedArtistsStateSelect = createSelector(
    selectFollowedArtistsAsArray(),
    (followedArtists) => ({ followedArtists })
);


const mapDispatchToProps = (dispatch, props) => ({
    onPressArtist: artist => props.navigation.navigate('ArtistDetail', { id: artist.id }),
})

export default connect(followedArtistsStateSelect, mapDispatchToProps)(FollowedArtistsPage)