import React from 'react'
import PropTypes from 'prop-types'
import { connect } from 'react-redux'
import LoginView from './login.component'
import { login, usernameChange, passwordChange } from './login.action'

LoginView.propTypes = {
    login: PropTypes.func.isRequired
}

LoginView.navigationOptions = {
    title: 'Login'
}

const mapStateToProps = (state, props) => ({
    error: state.login.error,
    loading: state.login.loading,
    username: state.login.username,
    password: state.login.password
})

const mapDispatchToProps = dispatch => ({
    usernameChange: username => dispatch(usernameChange(username)),
    passwordChange: password => dispatch(passwordChange(password)),
    login: (username, password) => dispatch(login(username,password))
})

export default connect(mapStateToProps, mapDispatchToProps)(LoginView)