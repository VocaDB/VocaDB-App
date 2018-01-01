import React from 'react'
import { connect } from 'react-redux'
import SongView from './song.component'
import { NavigationActions } from "react-navigation";
import {viewArtist, viewSearch} from "../nav/nav.action";
import {getSong} from "./song.action";
import PropTypes from 'prop-types'

const mapStateToProps = (state, props) => ({
    loading: state.song.loading,
    error: state.song.error,
    song: state.song.song,
    id: props.navigation.state.params.id,
})

const mapDispatchToProps = dispatch => ({
    back: () => dispatch(NavigationActions.back()),
    getSong: id => dispatch(getSong(id)),
    viewSearch: () => dispatch(viewSearch()),
    viewArtist: id => dispatch(viewArtist(id))
})

SongView.propTypes = {
    id: PropTypes.number.isRequired,
}


export default connect(mapStateToProps, mapDispatchToProps)(SongView)