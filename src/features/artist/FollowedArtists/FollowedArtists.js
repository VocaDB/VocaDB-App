import React from 'react'
import { ScrollView, Text } from 'react-native'
import Content from '../../../components/Content/index'
import ArtistList from '../ArtistList/index'
import Empty from './../../../components/Empty'

class FollowedArtists extends React.Component {

    render () {

        const noList = (!this.props.followedArtists || this.props.followedArtists.length === 0)

        if(noList) {
            return (<Empty text='You did not followed any artist.' icon='ios-person' />)
        }

        return (
            <Content>
                <ArtistList
                    artists={this.props.followedArtists}
                    onPressItem={this.props.onPressArtist} />
            </Content>
        )
    }
}

export default FollowedArtists