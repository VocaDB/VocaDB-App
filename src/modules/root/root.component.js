import React from 'react'
import Home from './../home/home.container'
import Profile from './../profile/profile.container'
import { Container, Title, Left, Right, Button, Icon, Body, Header, Content, Tab, Tabs, StyleProvider, TabHeading } from 'native-base';
import getTheme from './../../../native-base-theme/components';
import material from './../../../native-base-theme/variables/material';
import { Font } from 'expo';
import ScrollableTabView from 'react-native-scrollable-tab-view'

class Root extends React.Component {

    state = {
        fontLoaded: false,
    };

    componentWillMount() {
        Font.loadAsync({
            'Roboto': require('native-base/Fonts/Roboto.ttf'),
            'Roboto_medium': require('native-base/Fonts/Roboto_medium.ttf'),
        }).then(() => {
            this.setState({ fontLoaded: true });
        });
    }

    renderContent () {
        return (
            <StyleProvider  style={getTheme(material)}>
                <Container>
                    <Header hasTabs>
                        <Body>
                        <Title>VocaDB</Title>
                        </Body>
                        <Right>
                            <Button transparent onPress={() => this.props.viewSearch()}>
                                <Icon name='search' />
                            </Button>
                        </Right>
                    </Header>
                    <ScrollableTabView>
                        <Home tabLabel="Home" />
                        <Profile tabLabel="Profile" />
                    </ScrollableTabView>
                </Container>
            </StyleProvider>
        )
    }

    render () {
        return (this.state.fontLoaded) ? this.renderContent() : null
    }
}

export default Root