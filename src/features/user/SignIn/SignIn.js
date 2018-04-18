import React from 'react'
import { View, Text, ActivityIndicator } from 'react-native'
import { TextField } from 'react-native-material-textfield';
import { Button } from 'react-native-material-ui';
import PropTypes from 'prop-types'
import Theme from './../../../theme'

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
            <View style={{ backgroundColor: '#2C486E', flex: 1, paddingHorizontal: 32 }}>
                <View style={{ justifyContent: 'center', alignItems: 'center', height: 136 }}>
                    <Text style={{ color: '#FFFFFF', fontSize: 48 }}>VocaDB</Text>
                </View>
                <View style={{ flex: 1 }}>
                    <Block>
                        <TextField
                            label='Username'
                            onChangeText={this.onChangeUsername.bind(this)}
                            disabled={this.props.loading}
                            baseColor='#E0E0E0'
                            tintColor='#FFFFFF'
                            textColor='#FFFFFF' />

                        <View>
                            <TextField
                                label='Password'
                                secureTextEntry={true}
                                onChangeText={this.onChangePassword.bind(this)}
                                disabled={this.props.loading}
                                baseColor='#E0E0E0'
                                tintColor='#FFFFFF'
                                textColor='#FFFFFF' />
                        </View>


                    </Block>

                    <Actions loading={this.props.loading}>
                        <ErrorBlock error={this.props.error} />
                        <Button
                            raised
                            text='Sign in'
                            style={{ container: { backgroundColor: '#213A5B' }, text: { color: '#FFFFFF' } }}
                            onPress={this.onSignIn.bind(this)} />
                        <View style={{ height: 16 }}></View>
                        <Button
                            flat
                            text='Later'
                            style={{ container: { backgroundColor: '#2C486E', borderColor: '#FFFFFF', borderWidth: 1 }, text: { color: '#FFFFFF' } }}
                            onPress={this.onSkip.bind(this)} />
                    </Actions>
                </View>
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