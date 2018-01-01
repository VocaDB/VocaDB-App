import React from 'react'
import { connect } from 'react-redux'
import AlbumView from './album.component'
import {back, viewSearch, viewArtist, viewSong} from "../nav/nav.action";
import { NavigationActions } from "react-navigation";
import {getAlbum} from "./album.action";

const mapStateToProps = (state, props) => ({
    loading: state.album.loading,
    error: state.album.error,
    album: state.album.album,
    id: props.navigation.state.params.id,
})

const mapDispatchToProps = dispatch => ({
    back: () => dispatch(NavigationActions.back()),
    getAlbum: id => dispatch(getAlbum(id)),
    viewSearch: () => dispatch(viewSearch()),
    viewArtist: id => dispatch(viewArtist(id)),
    viewSong: id => dispatch(viewSong(id))
})

export default connect(mapStateToProps, mapDispatchToProps)(AlbumView)