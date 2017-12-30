import React from 'react'
import { connect } from 'react-redux'
import AlbumView from './album.component'
import { back } from "../nav/nav.action";
import { NavigationActions } from "react-navigation";

const mapStateToProps = (state, props) => ({
})

const mapDispatchToProps = dispatch => ({
    back: () => dispatch(NavigationActions.back()),
    viewSearch: () => dispatch(viewSearch())
})

export default connect(mapStateToProps, mapDispatchToProps)(AlbumView)