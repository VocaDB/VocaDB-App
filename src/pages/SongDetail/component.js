import React from 'react'
import { View, Text, Button, ScrollView, Image } from 'react-native'
import CenterView from './../../components/CenterView'
import ArtistList from './../../components/ArtistList'

export default class SongDetailPage extends React.Component {

    componentDidMount () {
        this.props.fetchSong()
    }

    renderSong () {
        return (
            <Text>{this.props.song.defaultName}</Text>
        )
    }

    render () {

        const song = this.props.song
        const artists = this.props.artists

        console.log(artists)
        return (
            <ScrollView style={{ flex: 1 }}>
                <View style={{ height: 200, backgroundColor: '#64B5F6' }}>
                    <CenterView style={{ backgroundColor: '#64B5F6' }}>
                        <Image
                            style={{ width: 160 , height: 100 }}
                            source={{ uri: song.thumbUrl }}
                        />
                        <Text>{song.defaultName}</Text>
                        <Text>{song.artistString}</Text>
                    </CenterView>
                </View>
                <View style={{ height: 60, backgroundColor: '#2196F3' }}>
                    <CenterView style={{ backgroundColor: '#2196F3', flexDirection: 'row' }}>
                        <Text>Like</Text>
                        <Text>Share</Text>
                    </CenterView>
                </View>
                <View style={{ backgroundColor: '#B3E5FC' }}>
                        <ArtistList artists={artists} />
                </View>
                <View style={{ height: 60, backgroundColor: '#1976D2' }}>
                    <CenterView style={{ backgroundColor: '#1976D2' }}>
                        <Text>Tags</Text>
                    </CenterView>
                </View>
                <View style={{ height: 200, backgroundColor: '#7986CB' }}>
                    <CenterView style={{ backgroundColor: '#7986CB' }}>
                        <Text>General info</Text>
                        <Text>Name</Text>
                        <Text>Duration</Text>
                        <Text>Published</Text>
                        <Text>Addition date</Text>
                    </CenterView>
                </View>
                <View style={{ height: 160, backgroundColor: '#3F51B5' }}>
                    <CenterView style={{ backgroundColor: '#3F51B5' }}>
                        <Text>Albums</Text>
                    </CenterView>
                </View>
                <View style={{ height: 200, backgroundColor: '#303F9F' }}>
                    <CenterView style={{ backgroundColor: '#303F9F' }}>
                        <Text>Web links</Text>
                    </CenterView>
                </View>
            </ScrollView>
        )
    }
}