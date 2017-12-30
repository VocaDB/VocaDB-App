import React from 'react'
import PropTypes from 'prop-types'
import { connect } from 'react-redux'
import HomeView from './home.component'
import { listRecentSongRequest, listRecentAlbumRequest, listRecentEventRequest } from './home.action'
import { viewSong, viewSearch } from './../nav/nav.action'

HomeView.propTypes = {
    songs: PropTypes.array.isRequired
}

const mapStateToProps = (state, props) => ({
    loading: state.home.loading,
    error: state.home.error,
    songs: state.home.songs,
    albums: state.home.albums,
    events: state.home.events
})

const mapDispatchToProps = dispatch => ({
    fetchSongs: () => dispatch(listRecentSongRequest()),
    fetchRecentAlbums: () => dispatch(listRecentAlbumRequest()),
    fetchEvents: () => dispatch(listRecentEventRequest()),
    viewSong: id => dispatch(viewSong(id)),
    viewSearch: () => dispatch(viewSearch())
})

export default connect(mapStateToProps, mapDispatchToProps)(HomeView)