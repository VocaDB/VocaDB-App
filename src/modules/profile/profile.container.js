import React from 'react'
import { connect } from 'react-redux'
import ProfileView from './profile.component'
import { signOut, signIn } from './profile.action'


ProfileView.navigationOptions = {
    title: 'Profile'
}

const mapStateToProps = (state, props) => ({
    isLogin: state
})

const mapDispatchToProps = dispatch => ({
    signOut: () => dispatch(signOut()),
    signIn: () => dispatch(signIn())
})

export default connect(mapStateToProps, mapDispatchToProps)(ProfileView)