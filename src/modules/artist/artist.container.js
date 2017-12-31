import React from 'react'
import { connect } from 'react-redux'
import ArtistView from './artist.component'
import { back, viewSearch, viewArtist } from "../nav/nav.action";
import { NavigationActions } from "react-navigation";

const mapStateToProps = (state, props) => ({
})

const mapDispatchToProps = dispatch => ({
    back: () => dispatch(NavigationActions.back()),
    viewSearch: () => dispatch(viewSearch()),
    viewArtist: () => dispatch(viewArtist())
})

export default connect(mapStateToProps, mapDispatchToProps)(ArtistView)