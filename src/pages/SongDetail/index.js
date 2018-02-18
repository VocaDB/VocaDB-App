import React from 'react'
import { connect } from 'react-redux'
import SongDetailPage from './component'
import * as actions from './actions'
import { createSelector } from 'reselect';
import { selectSongResult } from './selector'

SongDetailPage.navigationOptions = () => ({
    title: 'Detail'
})

SongDetailPage.propTypes = {

}

const songDetailStateSelect = createSelector(
    selectSongResult(),
    (song) => ({ song })
);

const mapDispatchToProps = (dispatch, props) => ({
    fetchSong: id => dispatch(actions.getSong(id)),
    onPressArtist: id => props.navigation.navigate('ArtistDetail', { id })
})

export default connect(songDetailStateSelect, mapDispatchToProps)(SongDetailPage)