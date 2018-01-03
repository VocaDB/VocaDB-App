import React from 'react'
import { View, TextInput, ScrollView, TouchableOpacity } from 'react-native'
import { Container, Content, Header, Left, Right, Thumbnail, Body, Text, H2, Spinner,  Title, StyleProvider, Button, Icon, Item, Input, Picker, List, ListItem } from 'native-base'
import getTheme from './../../../native-base-theme/components';
import material from './../../../native-base-theme/variables/material';
import images from './../../assets/images'

class SearchView extends React.Component {

    renderRecent ()  {

        const recentList = this.props.recentList

        return (
            <List>
                <ListItem itemHeader first>
                    <Text>Recent searches</Text>
                </ListItem>
                {recentList.map(entry => (
                    <ListItem key={entry.id} onPress={() => this.props.viewEntry(entry)}>
                        <Body>
                        <Text>{entry.defaultName}</Text>
                        <Text note>{entry.entryType}</Text>
                        </Body>
                    </ListItem>
                ))}
            </List>
        )
    }

    renderResult () {

        const emptyResult = (
            <View>
                <Text>No result</Text>
            </View>
        )

        const listItem = entry => {

            const imageUri = (entry.mainPicture)? entry.mainPicture.urlThumb : images.placeholderUri

            return (
                <ListItem key={entry.id} onPress={() => this.props.viewEntry(entry)}>
                    <Thumbnail square size={80} source={{ uri: imageUri }} defaultSource={images.unknownSong} />
                    <Body>
                        <Text>{entry.defaultName}</Text>
                        <Text note>{entry.entryType}</Text>
                    </Body>
                </ListItem>
            )
        }

        const result = (
            <List>
                <ListItem itemHeader first>
                    <Text>Results</Text>
                </ListItem>
                {this.props.entries.map(listItem)}
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
                                <Input placeholder="Search" onChangeText={text => this.props.searchEntry(text)} value={this.props.query} />
                            </Item>
                        </Header>
                        <Content>
                            {this.props.loading && <Spinner color='blue' />}
                            {this.props.query != '' && this.renderResult()}
                            {this.props.query == '' && this.renderRecent()}
                        </Content>
                    </Container>
                </StyleProvider>

            </View>
        )
    }
}

export default SearchView;