import React from 'react'
import { View, TextInput, ScrollView, TouchableOpacity } from 'react-native'
import { Container, Content, Header, Left, Right, Thumbnail, Body, Text, H2, Spinner,  Title, StyleProvider, Button, Icon, Item, Input, Picker, List, ListItem } from 'native-base'
import getTheme from './../../../native-base-theme/components';
import material from './../../../native-base-theme/variables/material';
import images from './../../assets/images'

class SearchView extends React.Component {

    renderRecent ()  {

        return (
            <List>
                <ListItem itemHeader first>
                    <Text>Recent searches</Text>
                </ListItem>
                <ListItem onPress={() => this.props.searchEntry('Romeo')}>
                    <Text>Miku</Text>
                </ListItem>
                <ListItem onPress={() => this.props.searchEntry('Gumi')}>
                    <Text>Gumi</Text>
                </ListItem>
                <ListItem onPress={() => this.props.searchEntry('Gumi')}>
                    <Text>Test 1</Text>
                </ListItem>
                <ListItem last onPress={() => this.props.searchEntry('Gumi')}>
                    <Text>Test 2</Text>
                </ListItem>
            </List>
        )
    }

    renderResult () {

        const emptyResult = (
            <View>
                <Text>No result</Text>
            </View>
        )
        const result = (
            <List>
                <ListItem itemHeader first>
                    <Text>Results</Text>
                </ListItem>
                {this.props.entries.map(entry => (
                    <ListItem key={entry.id} onPress={() => this.props.viewSong(entry.id)}>
                        <Thumbnail square size={80} source={images.logo} />
                        <Body>
                        <Text>{entry.defaultName}</Text>
                        <Text note>{entry.entryType}</Text>
                        </Body>
                    </ListItem>
                ))}
            </List>
        )

        return (this.props.loading) ? null : (this.props.entries) ? result  : emptyResult
    }


    render () {

        return (
            <View style={{
                backgroundColor: 'white',
                flex: 1
            }}>
                <StyleProvider  style={getTheme(material)}>
                    <Container>
                        <Header searchBar rounded>
                            <Button transparent onPress={this.props.back}>
                                <Icon name='arrow-back' />
                            </Button>
                            <Item>
                                <Icon name="ios-search" />
                                <Input placeholder="Search" onChangeText={text => this.props.searchEntry(text)} value={this.props.q} />
                            </Item>
                        </Header>
                        <Content>
                            {this.props.loading && <Spinner color='blue' />}
                            {this.props.q != '' && this.renderResult()}
                            {this.props.q == '' && this.renderRecent()}
                        </Content>
                    </Container>
                </StyleProvider>

            </View>
        )
    }
}

export default SearchView;