import React from 'react'
import { connect } from 'react-redux'
import AuthContent from './AuthContent'
import { selectIsAuthenticated } from '../userSelector'
import { createSelector } from 'reselect';

const mapStateSelect = createSelector(
    selectIsAuthenticated(),
    (isAuthenticated) => ({ isAuthenticated })
)

const mapDispatchToProps = (dispatch, props) => ({})

export default connect(mapStateSelect, mapDispatchToProps)(AuthContent)