import React from 'react'
import { connect } from 'react-redux'
import SongListPage from './component'
import { createSelector } from 'reselect';

SongListPage.navigationOptions = () => ({
    title: 'Song list',
    drawerLabel: 'Songs',
})

const mapStateToProps = state => ({
})

const mapDispatchToProps = dispatch => ({
})

export default connect(mapStateToProps, mapDispatchToProps)(SongListPage)