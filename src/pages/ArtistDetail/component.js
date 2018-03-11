import React from 'react'
import { View, Text } from 'react-native'
import images from '../../common/assets/images'
import Icon from './../../components/Icon'
import Theme from './../../theme'
import TagGroup from '../../features/tag/TagGroup'
import WebLinkList from '../../features/webLink/WebLinkList'
import EventList from '../../features/releaseEvent/EventList'
import SongList from '../../features/song/SongList'
import ScrollableTabView from 'react-native-scrollable-tab-view'
import AlbumList from '../../features/album/AlbumList'
import Content from './../../components/Content'
import Cover from './../../components/Cover'
import Divider from './../../components/Divider'

class ArtistDetailPage extends React.Component {

    componentDidMount () {
        const { params } = this.props.navigation.state;
        this.props.fetchArtist(params.id)
    }

    render () {
        const artist = this.props.artist
        const { params } = this.props.navigation.state;
        const imageUri = images.getArtistUri(params.id)

        if(!artist) {
            return (<View></View>)
        }

        console.log('is followed')
        console.log(this.props.followed);

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
                    {!this.props.followed && <Icon name='md-heart' text='Follow' onPress={() => this.props.onPressFollow(artist)} />}
                    {this.props.followed && <Icon name='md-heart' text='Followed' color={Theme.buttonActiveColor} onPress={() => this.props.onPressUnFollow(artist)} />}
                    <Icon name='md-share' text='Share' onPress={() => this.props.onPressShare(artist)} />
                    <Icon name='md-chatbubbles' text='Comment' />
                    <Icon name='md-information-circle'  text='Report' />
                </Section>
                {artist.tags != undefined && renderTagGroup()}
                {artist.description != undefined && renderDescription()}
                {artist.webLinks != undefined && renderWebLink()}
            </Content>
        )

        const SongListPage = () => {

            const renderLatestSongs = () => (
                <SongList max={7}
                          songs={artist.latestSongs}
                          title='Latest'
                          showHeader={true}
                          onPressItem={this.props.onPressSong}
                          onPressMore={() => this.props.onPressMoreLatestSongs(artist)} />
            )

            const renderPopularSongs = () => (
                <SongList max={7}
                          songs={artist.popularSongs}
                          title='Popular'
                          showHeader={true}
                          onPressItem={this.props.onPressSong} />
            )

            return (<Content>
                {artist.latestSongs != undefined && renderLatestSongs()}
                {artist.latestSongs != undefined && artist.popularSongs != undefined && <Divider />}
                {artist.popularSongs != undefined && renderPopularSongs()}
            </Content>)
        }

        const AlbumListPage = () => {

            const renderLatestAlbum = () => (
                <AlbumList max={7} albums={artist.latestAlbums} title='Latest' showHeader={true} onPressItem={this.props.onPressAlbum} />
            )

            const renderPopularAlbum = () => (
                <AlbumList max={7} albums={artist.popularAlbums} title='Popular' showHeader={true} onPressItem={this.props.onPressAlbum} />
            )
            return (
                <Content>
                    {artist.latestAlbums != undefined && renderLatestAlbum()}
                    {artist.latestAlbums != undefined && artist.popularAlbums != undefined && <Divider />}
                    {artist.popularAlbums != undefined && renderPopularAlbum()}
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
                {artist.latestAlbums != undefined || artist.popularAlbums != undefined && <AlbumListPage tabLabel='Albums' />}
                {artist.latestEvents != undefined && <EventListPage tabLabel='Events' />}
            </ScrollableTabView>
        )
    }
}

export default ArtistDetailPage