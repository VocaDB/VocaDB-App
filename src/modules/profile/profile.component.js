import React from 'react'
import { View } from 'react-native'
import { Container, Content, Thumbnail, Grid, Row, List, ListItem, Text, Button, StyleProvider } from 'native-base'
import getTheme from './../../../native-base-theme/components';
import material from './../../../native-base-theme/variables/material';
import images from './../../assets/images'

class ProfileView extends React.Component {
    renderProfile () {
        return (
            <Container style={{ backgroundColor: 'white' }}>
                <Content>
                    <View style={{
                        justifyContent: 'center',
                        alignItems: 'center',
                        marginVertical: 100
                    }}>
                        <Thumbnail large source={images.logo} />
                    </View>

                    <List>
                        <ListItem onPress={() => console.log('my list')}>
                            <Text>My list</Text>
                        </ListItem>
                        <ListItem onPress={() => console.log('sign out')}>
                            <Text>Sign out</Text>
                        </ListItem>
                    </List>
                </Content>
            </Container>
        )
    }

    renderSignin () {
        const Block = (props) => (
            <View style={{ margin: 15 }}>
                {props.children}
            </View>
        )

        return (
            <View style={{
                flex: 1,
                flexDirection: 'column',
                justifyContent: 'center',
                alignItems: 'center'
            }}>
                <Block>
                    <Text>You need to sign in first</Text>
                </Block>
                <Block>
                    <Button light onPress={() => this.props.signIn()}>
                        <Text>Sign in</Text>
                    </Button>
                </Block>
            </View>
        )
    }

    render() {
        return (
            <StyleProvider  style={getTheme(material)}>
                {this.renderSignin()}
            </StyleProvider>
        )
    }
}

export default ProfileView
