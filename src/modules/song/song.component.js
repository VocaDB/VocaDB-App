import React from 'react'
import { View, TouchableOpacity } from 'react-native'
import ListContainer from './../../components/ListContainer'
import MediaItem from './../../components/MediaItem'
import { Container, ListItem, Content, Text, Button, Header, Left, Right, Grid, Row, Col, Title, Icon, StyleProvider, Body, Thumbnail } from 'native-base'
import data from './../../sample/song'
import images from './../../assets/images'

class SongView extends React.Component {

    renderPvs () {
        return (
            <ListContainer
                title='PVs'
                items={data.pvs}
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
        return (
            <ListContainer
                title='Artists'
                items={data.artists.map(a => a.artist)}
                displayItem={artist => (
                    <TouchableOpacity key={artist.id} style={{ margin: 8 }} onPress={() => console.log('press')}>
                        <Thumbnail large source={{ uri: images.getArtistUri(artist.id) }} resizeMode='contain' />
                        <Text>{artist.name}</Text>
                        <Text note>{artist.artistType}</Text>
                    </TouchableOpacity>

                )}
                horizontal={true}
            />
        )
    }

    renderAlbums () {
        return (
            <ListContainer
                title='Albums'
                items={data.albums}
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
                                <Thumbnail square large source={{ uri: data.thumbUrl }} />
                                <Text>{data.defaultName}</Text>
                            </Body>
                        </Row>
                    </Grid>

                    {this.renderPvs()}

                    {this.renderArtists()}

                    {this.renderAlbums()}
                </Content>
            </Container>
        )
    }
}

export default SongView
