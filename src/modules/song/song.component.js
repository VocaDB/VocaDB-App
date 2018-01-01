import React from 'react'
import { Alert, TouchableOpacity } from 'react-native'
import ListContainer from './../../components/ListContainer'
import MediaItem from './../../components/MediaItem'
import { Container, ListItem, Content, Text, Button, Header, Left, Right, Spinner, Grid, Row, Col, Title, Icon, StyleProvider, Body, Thumbnail } from 'native-base'
import images from './../../assets/images'

class SongView extends React.Component {

    componentDidMount () {
        this.props.getSong(this.props.id)
    }

    renderPvs () {

        const pvs = (this.props.song.pvs) ? this.props.song.pvs : []

        return (
            <ListContainer
                title='PVs'
                items={pvs}
                displayItem={pv => (
                    <MediaItem
                        key={pv.id}
                        image={pv.thumbUrl}
                        title={pv.name}
                        subtitle={pv.author}
                        onMediaClick={() => console.log('a')}
                    />
                )}
            />
        )
    }

    renderArtists () {

        const artists = (this.props.song.artists) ? this.props.song.artists : []

        return (
            <ListContainer
                title='Artists'
                items={artists.map(a => a.artist)}
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
                        <Thumbnail square large source={{ uri: this.props.song.thumbUrl }} defaultSource={images.unknownSong} />
                        <Text>{this.props.song.defaultName}</Text>
                        </Body>
                    </Row>
                </Grid>

                {this.renderPvs()}

                {this.renderArtists()}

                {this.renderAlbums()}
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

    renderAlbums () {

        const albums = (this.props.song.albums) ? this.props.song.albums : []
        return (
            <ListContainer
                title='Albums'
                items={albums}
                displayItem={album => (
                    <MediaItem
                        key={album.id}
                        image={images.getAlbumUri(album.id)}
                        title={album.name}
                        subtitle={album.artistString}
                        horizontal={true}
                        onMediaClick={() => console.log('Click album')}
                    />

                )}
                horizontal={true}
            />
        )
    }

    render() {

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
                {!this.props.loading && this.props.song && this.renderContent()}
            </Container>
        )
    }
}

export default SongView
