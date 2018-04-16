import React from 'react'
import { View, Text, ActivityIndicator } from 'react-native'
import { TextField } from 'react-native-material-textfield';
import { Button } from 'react-native-material-ui';
import PropTypes from 'prop-types'
import Theme from './../../../theme'
import AuthContent from './../AuthContent'
import GuestContent from './../GuestContent'

const Actions = (props) => {
    if(props.loading) {
        return (<ActivityIndicator size="large"  />)
    }

    return (
        <View>
            {props.children}
        </View>
    )
}

const Block = (props) => (<View style={{ paddingVertical: 8 }}>{props.children}</View>)

const ErrorBlock = (props) => {
    if(!props.error) {
        return null;
    }

    return (
        <Block>
            <Text style={Theme.error}>{props.error}</Text>
        </Block>
    )
}

class SignIn extends React.PureComponent {

    state = {
        username: '',
        password: ''
    }

    componentDidMount() {
        if(this.props.isSkippedSignIn || this.props.isAuthenticated) {
            this.props.onPressSkip();
        }
    }

    onSignIn() {
        this.props.onPressSignIn(this.state.username, this.state.password);
    }

    onSkip() {
        this.props.onPressSkip();
    }

    onChangeUsername(username) {
        this.setState({ username })
    }

    onChangePassword(password) {
        this.setState({ password })
    }

    render () {

        return (
            <View style={{ paddingHorizontal: 32 }}>
                <TextField
                    label='Username'
                    onChangeText={this.onChangeUsername.bind(this)}
                    disabled={this.props.loading}
                />
                <TextField
                    label='Password'
                    secureTextEntry={true}
                    onChangeText={this.onChangePassword.bind(this)}
                    disabled={this.props.loading}
                />
                <View style={{ height: 16 }}></View>
                <Actions loading={this.props.loading}>
                    <ErrorBlock error={this.props.error} />
                    <Button
                        raised
                        primary
                        text='Sign in'
                        onPress={this.onSignIn.bind(this)} />
                    <View style={{ height: 16 }}></View>
                    <Button
                        flat
                        text='Skip'
                        onPress={this.onSkip.bind(this)} />
                </Actions>
            </View>
        )
    }
}

SignIn.propTypes = {
    onPressSkip: PropTypes.func,
    onPressSignIn: PropTypes.func,
    error: PropTypes.string,
    loading: PropTypes.bool
}

SignIn.defaultProps = {
    onPressSkip: () => console.log('Press skip'),
    onPressSignIn: () => console.log('Press sign in'),
    loading: false
}

export default SignIn;