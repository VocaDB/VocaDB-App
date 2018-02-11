import React from 'react'
import { connect } from 'react-redux'
import SongDetailPage from './component'
import * as actions from './actions'
import { createSelector } from 'reselect';
import { selectSong } from './selector'

SongDetailPage.navigationOptions = () => ({
    title: 'Detail'
})

SongDetailPage.propTypes = {

}

const songDetailStateSelect = createSelector(
    selectSong(),
    (song) => ({ song })
);

const mapDispatchToProps = dispatch => ({
    fetchSong: () => dispatch(actions.getSong())
})

export default connect(songDetailStateSelect, mapDispatchToProps)(SongDetailPage)