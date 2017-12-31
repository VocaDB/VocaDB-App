import React from 'react'
import { TouchableOpacity } from 'react-native'
import { Container, ListItem, Content, Text, Button, Header, Left, Right, Grid, Row, Col, Title, Icon, StyleProvider, Body, Thumbnail } from 'native-base'
import data from './../../sample/artist'
import images from './../../assets/images'
import ListContainer from './../../components/ListContainer'

class ArtistView extends React.Component {

    render () {
        return (
            <Container style={{ backgroundColor: 'white' }}>
                <Header>
                    <Left>
                        <Button transparent onPress={this.props.back}>
                            <Icon name='arrow-back' />
                        </Button>
                    </Left>
                    <Body>
                    <Title>Detail</Title>
                    </Body>
                    <Right>
                        <Button transparent onPress={() => this.props.viewSearch()}>
                            <Icon name='search' />
                        </Button>
                    </Right>

                </Header>
                <Content>
                    <Grid style={{ marginVertical: 16 }}>
                        <Row>
                            <Body>
                            <Thumbnail square large source={{ uri: images.getArtistUri(data.id) }} resizeMode='contain' />
                            <Text>{data.defaultName}</Text>
                            </Body>
                        </Row>
                    </Grid>
                </Content>
            </Container>
        )
    }
}

export default ArtistView;