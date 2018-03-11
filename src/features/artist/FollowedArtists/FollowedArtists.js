import React from 'react'
import { ScrollView, Text } from 'react-native'
import Content from '../../../components/Content/index'
import ArtistList from '../ArtistList/index'

class FollowedArtists extends React.Component {

    render () {
        return (
            <Content>
                <ArtistList artists={this.props.followedArtists} onPressItem={this.props.onPressArtist} />
            </Content>
        )
    }
}

export default FollowedArtists