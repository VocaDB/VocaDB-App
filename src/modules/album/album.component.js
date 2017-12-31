import React from 'react'
import { TouchableOpacity } from 'react-native'
import { Container, ListItem, Content, Text, Button, Header, Left, Right, Grid, Row, Col, Title, Icon, StyleProvider, Body, Thumbnail } from 'native-base'
import data from './../../sample/album'
import images from './../../assets/images'
import ListContainer from './../../components/ListContainer'

class AlbumView extends React.Component {

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
                                <Thumbnail square large source={{ uri: images.getAlbumUri(data.id) }} />
                                <Text>{data.defaultName}</Text>
                            </Body>
                        </Row>
                    </Grid>

                    <ListContainer
                        title='Artists'
                        items={data.artists.map(a => a.artist)}
                        displayItem={artist => (
                            <TouchableOpacity style={{ margin: 8 }} key={artist.id}  onPress={() => console.log('press')}>
                                <Thumbnail large source={{ uri: images.getArtistUri(artist.id) }}  />
                                <Text>{artist.name}</Text>
                                <Text note>{artist.artistType}</Text>
                            </TouchableOpacity>

                        )}
                        horizontal={true}
                    />
                </Content>
            </Container>
        )
    }
}

export default AlbumView;