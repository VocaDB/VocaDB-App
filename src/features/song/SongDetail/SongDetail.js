import React from 'react'
import { View, Text, ScrollView, Image } from 'react-native'
import AlbumList from '../../album/AlbumList/index'
import Icon from '../../../components/Icon/index'
import TagGroup from '../../tag/TagGroup/index'
import ArtistRoleList from '../../artistRole/ArtistRoleList/index'
import WebLinkList from '../../webLink/WebLinkList/index'
import ScrollableTabView from 'react-native-scrollable-tab-view'
import PVList from '../../pv/PVLIst/index'
import LyricGroup from '../../lyric/LyricGroup/index'
import Cover from '../../../components/Cover/index'
import Divider from '../../../components/Divider/index'

class SongDetail extends React.Component {

    componentDidMount () {

        if(this.props.navigation) {
            const { params } = this.props.navigation.state;
            this.props.fetchSong(params.id)
        }
    }

    render () {
        const song = this.props.song

        if(!song) {
            return (<View>
                <Text></Text>
            </View>)
        }


        const Section = props => (<View style={[{ paddingHorizontal: 4 },props.style]}>{props.children}</View>)

        const InfoPage = props => {

            const renderTagGroup = () => (
                <Section>
                    <Divider />
                    <TagGroup tags={song.tags} max={5} onPressTag={this.props.onPressTag} />
                </Section>
            )

            const renderPVList = () => (
                <Section>
                    <Divider />
                    <PVList pvs={song.pvs} type='Original' title='Original PVs' showHeader />
                </Section>
            )

            const renderAlbumList = () => (
                <Section>
                    <Divider />
                    <AlbumList max={3} albums={song.albums} title='Albums' onPressItem={this.props.onPressAlbum} showHeader />
                </Section>
            )

            const renderWebLinkList = () => (
                <Section>
                    <Divider />
                    <WebLinkList webLinks={song.webLinks} category='Official' title='Official' />
                </Section>
            )

            return (
                <ScrollView style={{ flex: 1, backgroundColor: 'white' }}>
                    <Cover
                        imageUri={song.thumbUrl}
                        title={song.defaultName}
                        subtitle={song.artistString}
                    />
                    <Section style={{ flex: 1, flexDirection: 'row', alignItems: 'center', justifyContent: 'space-around' }}>
                        <Icon name='md-heart' text='Favorite' />
                        <Icon name='md-share' text='Share' onPress={() => this.props.onPressShare(song)} />
                        <Icon name='md-chatbubbles' text='Comment' />
                        <Icon name='md-information-circle'  text='Report' />
                    </Section>

                    {song.tags && renderTagGroup()}
                    {song.pvs && renderPVList()}
                    {song.albums && renderAlbumList()}
                    {song.webLinks && renderWebLinkList()}

                </ScrollView>
            )
        }

        const ArtistRoleListPage = () => (
            <ScrollView style={{ flex: 1, backgroundColor: 'white' }}>
                <ArtistRoleList artists={song.artists} onPressItem={this.props.onPressArtist} displayRole />
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
                <ArtistRoleListPage tabLabel='Artists' />
                {song.lyrics && song.lyrics.length > 0 && <LyricGropuPage tabLabel='Lyrics' />}
            </ScrollableTabView>
        )
    }
}

SongDetail.detaulProps = {
}

export default SongDetail