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

const mapDispatchToProps = dispatch => ({
    fetchSong: id => dispatch(actions.getSong(id))
})

export default connect(songDetailStateSelect, mapDispatchToProps)(SongDetailPage)