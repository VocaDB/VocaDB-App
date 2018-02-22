import React from 'react'
import { View, Text, Image, ScrollView } from 'react-native'
import images from './../../assets/images'
import { COLOR } from 'react-native-material-ui'
import Icon from './../../components/Icon'
import Theme from './../../theme'
import TagGroup from './../../components/TagGroup'
import CenterView from './../../components/CenterView'
import WebLinkList from './../../components/WebLinkList'
import EventList from './../../components/EventList'
import SongList from './../../components/SongList'
import ScrollableTabView from 'react-native-scrollable-tab-view'
import AlbumList from './../../components/AlbumList'
import Content from './../../components/Content'
import Cover from './../../components/Cover'

class ArtistDetailPage extends React.Component {

    componentDidMount () {
        const { params } = this.props.navigation.state;
        this.props.fetchArtist(params.id)
    }

    render () {

        const { params } = this.props.navigation.state;
        const imageUri = images.getArtistUri(params.id)

        const artist = this.props.artist

        const Section = props => (<View style={[{ marginVertical: 8, paddingHorizontal: 4 },props.style]}>{props.children}</View>)

        const InfoPage = () => (
            <Content>
                <Cover
                    imageUri={imageUri}
                    title={artist.name}
                    subtitle={artist.artistType}
                />
                <Section style={{ flex: 1, flexDirection: 'row' }}>
                    <Icon name='md-heart' text='Follow' />
                    <Icon name='md-share' text='Share' onPress={() => this.props.onPressShare(artist)} />
                    <Icon name='md-chatbubbles' text='Comment' />
                    <Icon name='md-information-circle'  text='Report' />
                </Section>
                <Section>
                    <TagGroup tags={artist.tags} max={5} onPressTag={this.props.onPressTag} />
                </Section>
                <Section>
                    <Text style={Theme.body}>{artist.description}</Text>
                </Section>
                <Section>
                    <WebLinkList webLinks={artist.webLinks} category='Official' title='Official' />
                    <WebLinkList webLinks={artist.webLinks} category='Commercial' title='Commercial' />
                    <WebLinkList webLinks={artist.webLinks} category='Reference' title='Reference' />
                </Section>
            </Content>
        )

        const SongListPage = () => (
            <Content>
                <SongList songs={artist.latestSongs} title='Latest' showHeader={true} onPressItem={this.props.onPressSong} />
                <SongList songs={artist.popularSongs} title='Popular' showHeader={true} onPressItem={this.props.onPressSong} />
            </Content>
        )

        const AlbumListPage = () => (
            <Content>
                <AlbumList albums={artist.latestAlbums} title='Latest' showHeader={true} onPressItem={this.props.onPressAlbum} />
                <AlbumList albums={artist.popularAlbums} title='Popular' showHeader={true} onPressItem={this.props.onPressAlbum} />
            </Content>
        )

        const EventListPage = () => (
            <Content>
                <EventList events={artist.latestEvents} />
            </Content>
        )

        return (
            <ScrollableTabView>
                <InfoPage tabLabel='Info' />
                <SongListPage tabLabel='Songs' />
                <AlbumListPage tabLabel='Albums' />
                <EventListPage tabLabel='Events' />
            </ScrollableTabView>
        )
    }
}

export default ArtistDetailPage