import React from 'react'
import { ScrollView, Text } from 'react-native'
import Content from './../../components/Content'
import ArtistList from './../../components/ArtistList'

class FollowedArtistsPage extends React.Component {

    render () {
        return (
            <Content>
                <ArtistList artists={this.props.followedArtists} onPressItem={this.props.onPressArtist} />
            </Content>
        )
    }
}

export default FollowedArtistsPage