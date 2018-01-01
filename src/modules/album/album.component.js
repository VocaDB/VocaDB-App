import React from 'react'
import { TouchableOpacity } from 'react-native'
import { Container, ListItem, Content, Text, Button, Header, Left, Spinner, Right, Grid, Row, Col, Title, Icon, StyleProvider, Body, Thumbnail } from 'native-base'
import images from './../../assets/images'
import ListContainer from './../../components/ListContainer'

class AlbumView extends React.Component {

    componentDidMount () {
        this.props.getAlbum(this.props.id)
    }

    renderArtists () {

        const artists = (this.props.album.artists) ? this.props.album.artists : []

        return (
            <ListContainer
                title='Artists'
                items={artists.map(a => (a.artist) ? a.artist : null).filter(a => a!=null)}
                displayItem={artist => (
                    <TouchableOpacity key={artist.id} style={{ margin: 8 }} onPress={() => this.props.viewArtist(artist.id)}>
                        <Thumbnail large source={{ uri: images.getArtistUri(artist.id) }} resizeMode='contain' defaultSource={images.unknownArtist} />
                        <Text>{artist.name}</Text>
                        <Text note>{artist.artistType}</Text>
                    </TouchableOpacity>

                )}
                horizontal={true}
            />
        )
    }

    renderContent () {
        return (
            <Content>
                <Grid style={{ marginVertical: 16 }}>
                    <Row>
                        <Body>
                        <Thumbnail square large source={{ uri: images.getAlbumUri(this.props.album.id) }} />
                        <Text>{this.props.album.defaultName}</Text>
                        </Body>
                    </Row>
                </Grid>

                {this.renderArtists()}
            </Content>
        )
    }

    renderLoading () {
        return (
            <Content>
                <Spinner color='blue' />
            </Content>
        )
    }

    render () {

        const { error } = this.props;

        if(error) {
            Alert.alert('Error', error.message);
        }

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

                {this.props.loading && this.renderLoading()}
                {!this.props.loading && this.renderContent()}

            </Container>
        )
    }
}

export default AlbumView;