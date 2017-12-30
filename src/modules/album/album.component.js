import React from 'react'
import { Container, ListItem, Content, Text, Button, Header, Left, Right, Grid, Row, Col, Title, Icon, StyleProvider, Body, Thumbnail } from 'native-base'

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
                </Content>
            </Container>
        )
    }
}

export default AlbumView;