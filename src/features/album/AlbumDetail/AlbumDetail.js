import React from 'react'
import { View, Text, Image, ScrollView } from 'react-native'
import images from '../../../common/assets/images'
import Icon from '../../../components/Icon/index'
import Theme from '../../../theme'
import TagGroup from '../../tag/TagGroup/index'
import WebLinkList from '../../webLink/WebLinkList/index'
import EventList from '../../releaseEvent/EventList/index'
import ScrollableTabView from 'react-native-scrollable-tab-view'
import ArtistRoleList from '../../artistRole/ArtistRoleList/index'
import Cover from '../../../components/Cover/index'
import Content from '../../../components/Content/index'
import TrackList from '../../track/TrackList/index'
import Divider from '../../../components/Divider/index'

class AlbumDetail extends React.Component {
    componentDidMount () {
        const { params } = this.props.navigation.state;
        this.props.fetchAlbum(params.id)
    }

    render () {

        const album = this.props.album

        if(!album) {
            return (<View></View>)
        }

        const { params } = this.props.navigation.state;
        const imageUri = images.getAlbumUri(params.id)

        const Section = props => (<View style={[{ marginVertical: 8, paddingHorizontal: 4 },props.style]}>{props.children}</View>)

        const renderTagGroup = () => (
            <Section>
                <Divider />
                <TagGroup tags={album.tags} max={5} onPressTag={this.props.onPressTag} />
            </Section>
        )

        const renderDescription = () => (
            <Section>
                <Text style={Theme.body}>{album.description}</Text>
            </Section>
        )

        const renderTracks = () => (
            <Section>
                <Divider />
                <TrackList tracks={album.tracks} onPressItem={this.props.onPressTrack} />
            </Section>
        )

        const renderWebLinks = () => (
            <Section>
                <Divider />
                <WebLinkList webLinks={album.webLinks} category='Official' title='Official' />
                <WebLinkList webLinks={album.webLinks} category='Commercial' title='Commercial' />
                <WebLinkList webLinks={album.webLinks} category='Reference' title='Reference' />
            </Section>
        )

        const InfoPage = () => (
            <Content>
                <Cover
                    imageUri={imageUri}
                    title={album.name}
                    subtitle={album.artistString}
                />
                <Section style={{ flex: 1, flexDirection: 'row', alignItems: 'center', justifyContent: 'space-around' }}>
                    <Icon name='md-heart' text='Follow' />
                    <Icon name='md-share' text='Share' onPress={() => this.props.onPressShare(album)} />
                    <Icon name='md-chatbubbles' text='Comment' />
                    <Icon name='md-information-circle'  text='Report' />
                </Section>

                {album.tags != undefined && renderTagGroup()}
                {album.description != undefined && renderDescription()}
                {album.tracks != undefined && renderTracks()}
                {album.webLinks != undefined && renderWebLinks()}

            </Content>
        )

        const ArtistRoleListPage = () => (
            <Content>
                <ArtistRoleList artists={album.artists} onPressItem={this.props.onPressArtist} />
            </Content>
        )

        const EventListPage = () => (
            <Content>
                <EventList events={album.releaseEvents} />
            </Content>
        )

        return (
            <ScrollableTabView>
                <InfoPage tabLabel='Info' />
                <ArtistRoleListPage tabLabel='Artists' />
                {album.releaseEvents != undefined && <EventListPage tabLabel='Events' />}
            </ScrollableTabView>
        )
    }
}

export default AlbumDetail