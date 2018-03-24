import React from 'react'
import { ScrollView, Text } from 'react-native'
import Content from '../../../components/Content'
import SongList from '../SongList'
import Empty from './../../../components/Empty'

class FavoriteSongs extends React.Component {

    render () {

        const noList = (!this.props.songs || this.props.songs.length === 0)

        if(noList) {
            return (<Empty text='No any favorite song' icon='ios-person' />)
        }

        return (
            <Content>
                <SongList
                    songs={this.props.songs}
                    onPressItem={this.props.onPressSong} />
            </Content>
        )
    }
}

export default FavoriteSongs