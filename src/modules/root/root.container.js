import React from 'react'
import { connect } from 'react-redux'
import RootView from './root.component'
import { viewSearch } from './root.action'

const mapStateToProps = (state, props) => ({
})

const mapDispatchToProps = dispatch => ({
    viewSearch: () => dispatch(viewSearch())
})

export default connect(mapStateToProps, mapDispatchToProps)(RootView)