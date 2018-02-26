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
import Divider from './../../components/Divider'

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

        const renderTagGroup = () => (
            <Section>
                <Divider />
                <TagGroup tags={artist.tags} max={5} onPressTag={this.props.onPressTag} />
            </Section>
        )

        const renderDescription = () => (
            <Section>
                <Text style={Theme.body}>{artist.description}</Text>
            </Section>
        )

        const renderWebLink = () => (
            <Section>
                <Divider />
                <WebLinkList webLinks={artist.webLinks} category='Official' title='Official' />
                <WebLinkList webLinks={artist.webLinks} category='Commercial' title='Commercial' />
                <WebLinkList webLinks={artist.webLinks} category='Reference' title='Reference' />
            </Section>
        )

        const InfoPage = () => (
            <Content>
                <Cover
                    imageUri={imageUri}
                    title={artist.name}
                    subtitle={artist.artistType}
                />
                <Section style={{ flex: 1, flexDirection: 'row', alignItems: 'center', justifyContent: 'space-around' }}>
                    <Icon name='md-heart' text='Follow' />
                    <Icon name='md-share' text='Share' onPress={() => this.props.onPressShare(artist)} />
                    <Icon name='md-chatbubbles' text='Comment' />
                    <Icon name='md-information-circle'  text='Report' />
                </Section>
                {artist.tags.length > 0 && renderTagGroup()}
                {artist.description != undefined && renderDescription()}
                {artist.webLinks.length > 0 && renderWebLink()}
            </Content>
        )

        const SongListPage = () => {

            const renderLatestSongs = () => (
                <SongList max={10}
                          songs={artist.latestSongs}
                          title='Latest'
                          showHeader={true}
                          onPressItem={this.props.onPressSong} />
            )

            const renderPopularSongs = () => (
                <SongList max={10}
                          songs={artist.popularSongs}
                          title='Popular'
                          showHeader={true}
                          onPressItem={this.props.onPressSong} />
            )

            return (<Content>
                {artist.latestSongs.length > 0 && renderLatestSongs()}
                {artist.latestSongs.length > 0 && artist.popularSongs.length > 0 && <Divider />}
                {artist.popularSongs.length > 0 && renderPopularSongs()}
            </Content>)
        }

        const AlbumListPage = () => {

            const renderLatestAlbum = () => (
                <AlbumList max={10} albums={artist.latestAlbums} title='Latest' showHeader={true} onPressItem={this.props.onPressAlbum} />
            )

            const renderPopularAlbum = () => (
                <AlbumList max={10} albums={artist.popularAlbums} title='Popular' showHeader={true} onPressItem={this.props.onPressAlbum} />
            )
            return (
                <Content>
                    {artist.latestAlbums.length > 0 && renderLatestAlbum()}
                    {artist.latestAlbums.length > 0 && artist.popularAlbums.length > 0 && <Divider />}
                    {artist.popularAlbums.length > 0 && renderPopularAlbum()}
                </Content>
            )
        }



        const EventListPage = () => (
            <Content>
                <EventList events={artist.latestEvents} />
            </Content>
        )

        return (
            <ScrollableTabView>
                <InfoPage tabLabel='Info' />
                <SongListPage tabLabel='Songs' />
                {artist.latestAlbums.length > 0 || artist.popularAlbums.length > 0 && <AlbumListPage tabLabel='Albums' />}
                {artist.latestEvents.length > 0 && <EventListPage tabLabel='Events' />}
            </ScrollableTabView>
        )
    }
}

export default ArtistDetailPage