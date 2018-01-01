import React from 'react'
import { TouchableOpacity } from 'react-native'
import { Container, ListItem, Content, Text, Button, Header, Spinner, Left, Right, Grid, Row, Col, Title, Icon, StyleProvider, Body, Thumbnail } from 'native-base'
import images from './../../assets/images'
import ListContainer from './../../components/ListContainer'
import MediaItem from "../../components/MediaItem/mediaItem.component";

class ArtistView extends React.Component {

    componentDidMount () {
        this.props.getArtist(this.props.id)
    }

    renderContent () {
        return (
            <Content>
                <Grid style={{ marginVertical: 16 }}>
                    <Row>
                        <Body>
                        <Thumbnail square large source={{ uri: images.getArtistUri(this.props.artist.id) }} resizeMode='contain' />
                        <Text>{this.props.artist.defaultName}</Text>
                        </Body>
                    </Row>
                </Grid>

                {this.renderLatestAlbums()}
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

    renderLatestAlbums () {

        const albums = (this.props.artist.relations)? this.props.artist.relations.latestAlbums : []
        return (
            <ListContainer
                title='Latest albums'
                items={albums}
                displayItem={album => (
                    <MediaItem
                        key={album.id}
                        image={images.getAlbumUri(album.id)}
                        title={album.name}
                        subtitle={album.artistString}
                        horizontal={true}
                        onMediaClick={() => this.props.viewAlbum(album.id)}
                    />

                )}
                horizontal={true}
            />
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

export default ArtistView;