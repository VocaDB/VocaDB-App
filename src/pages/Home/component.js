import React from 'react'
import { View, Text, Button, ScrollView } from 'react-native'
import SongList from '../../components/SongList'
import AlbumList from '../../components/AlbumList'

export default class HomePage extends React.Component {

    componentDidMount () {
        this.props.fetchRecentSongs()
        this.props.fetchPopularSongs()
    }

    render () {
        return (
            <ScrollView>
                <SongList title='Recent songs' max={5} showHeader={true} songs={this.props.recentSongs} onPressItem={this.props.onPressSong} />
                <SongList title='Popular songs' max={5} showHeader={true} songs={this.props.popularSongs} onPressItem={this.props.onPressSong} />
                <AlbumList title='Recent albums' max={10} horizontal={true} showHeader={true} albums={this.props.popularAlbums} onPressItem={this.props.onPressSong} />
            </ScrollView>
        )
    }
}