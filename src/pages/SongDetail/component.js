import React from 'react'
import { View, Text, ScrollView, Image } from 'react-native'
import CenterView from './../../components/CenterView'
import ArtistList from './../../components/ArtistList'
import AlbumList from './../../components/AlbumList'
import { Button } from 'react-native-elements'
import Icon from './../../components/Icon'
import TagGroup from './../../components/TagGroup'
import Info from './../../components/Info'
import ArtistRoleList from './../../components/ArtistRoleList'
import WebLinkList from './../../components/WebLinkList'

export default class SongDetailPage extends React.Component {

    componentDidMount () {
        this.props.fetchSong()
    }

    render () {

        const song = this.props.song
        const artists = this.props.artists

        const Section = props => (<View style={[{ marginVertical: 8},props.style]}>{props.children}</View>)

        return (
            <ScrollView style={{ flex: 1 }}>
                <View style={{ height: 180, backgroundColor: '#FFFFFF' }}>
                    <CenterView style={{ backgroundColor: '#FFFFFF', justifyContent: 'space-around', padding: 10 }}>
                        <Image
                            style={{ width: 160 , height: 100 }}
                            source={{ uri: song.thumbUrl }}
                        />
                        <Text style={{ fontSize: 18}}>{song.defaultName}</Text>
                        <Text>{song.artistString}</Text>
                    </CenterView>
                </View>
                <Section style={{ flex: 1, flexDirection: 'row' }}>
                    <Icon name='heart' text='Favorite' />
                    <Icon name='share' text='Share' />
                    <Icon name='comments' text='Comment' />
                    <Icon name='exclamation-circle'  text='Report' />
                </Section>
                <Section>
                    <TagGroup tags={song.tags} max={5} />
                </Section>
                <Section>
                    <ArtistList artists={artists} horizontal showHeader hideMoreButton title='Artists' />
                </Section>
                <Section>
                    <AlbumList albums={song.albums} horizontal showHeader hideMoreButton title='Albums' />
                </Section>
                <Section>
                    <WebLinkList webLinks={song.webLinks} category='Official' title='Official' />
                    <WebLinkList webLinks={song.webLinks} category='Reference' title='Reference' />
                </Section>
            </ScrollView>
        )
    }
}