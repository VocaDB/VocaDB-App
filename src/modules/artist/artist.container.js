import React from 'react'
import { connect } from 'react-redux'
import ArtistView from './artist.component'
import {back, viewSearch, viewAlbum, viewSong} from "../nav/nav.action";
import { NavigationActions } from "react-navigation";
import {getArtist} from "./artist.action";

const mapStateToProps = (state, props) => ({
    loading: state.artist.loading,
    error: state.artist.error,
    artist: state.artist.artist,
    id: props.navigation.state.params.id,
})

const mapDispatchToProps = dispatch => ({
    back: () => dispatch(NavigationActions.back()),
    getArtist: id => dispatch(getArtist(id)),
    viewSearch: () => dispatch(viewSearch()),
    viewAlbum: id => dispatch(viewAlbum(id)),
    viewSong: id => dispatch(viewSong(id))
})

export default connect(mapStateToProps, mapDispatchToProps)(ArtistView)