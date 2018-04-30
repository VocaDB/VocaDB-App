import React from 'react'
import { connect } from 'react-redux'
import SignIn from './SignIn'
import { createSelector } from 'reselect';
import * as userActions from '../userActions'
import { selectLoading, selectError } from './../../../app/appSelector'
import { selectIsAuthenticated, selectIsSkippedSignIn } from './../userSelector'

SignIn.navigationOptions = ({ navigation }) => {
    return { header: null }
}

const mapStateSelect = createSelector(
    selectLoading(),
    selectError(),
    selectIsAuthenticated(),
    selectIsSkippedSignIn(),
    (loading, error, isAuthenticated, isSkippedSignIn) => ({ loading, error: (error)? error.message : null, isAuthenticated, isSkippedSignIn })
);

const mapDispatchToProps = (dispatch, props) => ({
    onPressSignIn: (username, password) => dispatch(userActions.signIn(username, password)),
    onPressSkip: () =>  {
        dispatch(userActions.skipSignIn())
        dispatch(userActions.resetAction())
    },
})

export default connect(mapStateSelect, mapDispatchToProps)(SignIn)