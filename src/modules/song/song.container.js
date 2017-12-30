import React from 'react'
import { connect } from 'react-redux'
import SongView from './song.component'
import { NavigationActions } from "react-navigation";

SongView.navigationOptions = {
    title: 'Searchs'
}

const mapStateToProps = (state, props) => ({
    loading: state.search.loading,
    error: state.search.error
})

const mapDispatchToProps = dispatch => ({
    back: () => dispatch(NavigationActions.back())
})

export default connect(mapStateToProps, mapDispatchToProps)(SongView)