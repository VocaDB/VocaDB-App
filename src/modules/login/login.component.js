import React from 'react'
import { View } from 'react-native'
import { Button, Text, Spinner, Content, Form, Item, Input, StyleProvider } from 'native-base';
import getTheme from './../../../native-base-theme/components';
import material from './../../../native-base-theme/variables/material';

class LoginView extends React.Component {

    renderSubmit () {
        return (
            <Button block style={{ marginTop: 32, marginHorizontal: 8 }} onPress={() => this.props.login(this.props.username, this.props.password)}>
                <Text>Sign in</Text>
            </Button>
        )
    }

    renderSpinner () {
        return (
            <Spinner color='blue' />
        )
    }

    renderForm () {
        return (
            <Content>
                <Form>
                    <Item>
                        <Input placeholder="Username" onChangeText={text => this.props.usernameChange(text)} value={this.props.username} />
                    </Item>
                    <Item last>
                        <Input placeholder="Password" onChangeText={text => this.props.passwordChange(text)} value={this.props.password} />
                    </Item>
                </Form>

                {this.props.loading && this.renderSpinner()}
                {!this.props.loading && this.renderSubmit()}
            </Content>
        )
    }

    render () {
        return (
            <StyleProvider  style={getTheme(material)}>
                <View style={{ backgroundColor:'white', flex: 1 }}>
                    <View style={{ backgroundColor: '#635DB7', flex: 2 }}></View>
                    <View style={{ flex: 1 }}>
                        {this.renderForm()}
                    </View>
                </View>
            </StyleProvider>
        )
    }
}

export default LoginView