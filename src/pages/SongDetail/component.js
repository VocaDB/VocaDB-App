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
import ScrollableTabView from 'react-native-scrollable-tab-view'
import PVList from './../../components/PVLIst'
import LyricGroup from './../../components/LyricGroup'
import Theme from './../../theme'

export default class SongDetailPage extends React.Component {

    componentDidMount () {
        const { params } = this.props.navigation.state;
        this.props.fetchSong(params.id)
    }

    render () {
        const song = this.props.song


        const Section = props => (<View style={[{ marginVertical: 8, paddingHorizontal: 4 },props.style]}>{props.children}</View>)

        const InfoPage = props => {

            return (
                <ScrollView style={{ flex: 1, backgroundColor: 'white' }}>
                    <View style={{ height: 180, backgroundColor: '#B0BEC5' }}>
                        <CenterView style={{ backgroundColor: '#546E7A', justifyContent: 'space-around', padding: 10 }}>
                            <Image
                                style={{ width: 160 , height: 100 }}
                                source={{ uri: song.thumbUrl }}
                            />
                            <Text style={Theme.displayReverse_1}>{song.defaultName}</Text>
                            <Text style={Theme.displayReverse_2}>{song.artistString}</Text>
                        </CenterView>
                    </View>
                    <Section style={{ flex: 1, flexDirection: 'row' }}>
                        <Icon name='md-heart' text='Favorite' />
                        <Icon name='md-share' text='Share' />
                        <Icon name='md-chatbubbles' text='Comment' />
                        <Icon name='md-information-circle'  text='Report' />
                    </Section>
                    <Section>
                        <TagGroup tags={song.tags} max={5} />
                    </Section>
                    <Section>
                        <WebLinkList webLinks={song.webLinks} category='Official' title='Official' />
                        <WebLinkList webLinks={song.webLinks} category='Reference' title='Reference' />
                    </Section>
                </ScrollView>
            )
        }

        const PVListPage = () => (
            <ScrollView style={{ flex: 1, backgroundColor: 'white' }}>
                <PVList pvs={song.pvs} type='Original' title='Original' showHeader />
                <PVList pvs={song.pvs} type='Reprint' title='Reprint' showHeader />
                <PVList pvs={song.pvs} type='Other' title='Other' showHeader />
            </ScrollView>
        )

        const ArtistRoleListPage = () => (
            <ScrollView style={{ flex: 1, backgroundColor: 'white' }}>
                <ArtistRoleList artists={song.artists} title='Producer' category='Producer' onPressItem={this.props.onPressArtist} />
                <ArtistRoleList artists={song.artists} title='Vocalist' category='Vocalist' onPressItem={this.props.onPressArtist} />
                <ArtistRoleList artists={song.artists} title='Other' category='Other' onPressItem={this.props.onPressArtist} displayRole />
            </ScrollView>
        )

        const AlbumListPage = () => (
            <ScrollView style={{ flex: 1, backgroundColor: 'white' }}>
                <AlbumList albums={song.albums} title='Albums' />
            </ScrollView>
        )

        const LyricGropuPage = () => (
            <ScrollView style={{ flex: 1, backgroundColor: 'white' }}>
                <LyricGroup lyrics={song.lyrics} />
            </ScrollView>
        )

        return (
            <ScrollableTabView>
                <InfoPage tabLabel='Info' />
                {song.pvs.length > 0 && <PVListPage tabLabel='PVs' />}
                <ArtistRoleListPage tabLabel='Artists' />
                {song.albums.length > 0 && <AlbumListPage tabLabel='Albums' />}
                {song.lyrics.length > 0 && <LyricGropuPage tabLabel='Lyrics' />}
            </ScrollableTabView>
        )
    }
}