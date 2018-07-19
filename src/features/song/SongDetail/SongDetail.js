import React from 'react';
import { View, Text, ScrollView } from 'react-native';
import Icon from '../../../components/Icon/index';
import TagGroup from '../../tag/TagGroup/index';
import ArtistRoleList from '../../artistRole/ArtistRoleList/index';
import WebLinkList from '../../webLink/WebLinkList/index';
import ScrollableTabView from 'react-native-scrollable-tab-view';
import PVList from '../../pv/PVLIst/index';
import LyricGroup from '../../lyric/LyricGroup/index';
import Cover from '../../../components/Cover/index';
import Divider from '../../../components/Divider/index';
import YouTubePlayer from '../../../components/YouTubePlayer';
import NNDPlayer from '../../../components/NNDPlayer';
import BBPlayer from '../../../components/BBPlayer';
import SoundCloudPlayer from '../../../components/SoundCloudPlayer';
import Theme from '../../../theme';
import AlbumHorizontalList  from '../../album/AlbumHorizontalList';
import Expander from './../../../components/Expander';
import moment from 'moment';
import SongRow from './../SongRow';
import { translateSongType } from './../songConstant';
import i18n from './../../../common/i18n';

const toMSS = function (sec_num) {

    if(!sec_num) {
        return '0';
    }

    var hours   = Math.floor(sec_num / 3600);
    var minutes = Math.floor((sec_num - (hours * 3600)) / 60);
    var seconds = sec_num - (hours * 3600) - (minutes * 60);

    if (minutes < 10) {minutes = minutes;}
    if (seconds < 10) {seconds = "0"+seconds;}
    return minutes+':'+seconds;
}

class SongDetail extends React.PureComponent {

    state = {
        shouldRender: false
    }

    componentDidMount () {
        if(this.props.navigation) {
            const { params } = this.props.navigation.state;
            this.props.fetchSong(params.id);
        }

        setTimeout(() => { this.setState({ shouldRender: true }) }, 0);
    }

    render () {

        const song = this.props.song

        if(!song || !this.state.shouldRender) {
            return (<View>
                <Text></Text>
            </View>)
        }

        const Section = props => (<View style={[{ paddingHorizontal: 4 },props.style]}>{props.children}</View>)

        const renderExpandableContent = () => {
            return (
                <Expander
                    content={
                        <Section>
                            <Text style={[Theme.subhead, { padding: 8 }]}>{i18n.name}</Text>
                            <View style={{ paddingHorizontal: 8 }}>
                                <Text style={Theme.body} >{song.name}</Text>
                                <Text style={Theme.body} >{song.additionalNames}</Text>
                            </View>
                        </Section>
                    }
                />
            )
        }

        const renderTagGroup = () => (
            <Section>
                <Divider />
                <TagGroup tags={song.tags} max={5} onPressTag={this.props.onPressTag} />
            </Section>
        )

        const renderPVList = () => {

            if(song.pvs && song.pvs.length == 0) {
                return;
            }

            if(this.props.originalPVs.length == 0) {
                return (
                    <PVList pvs={this.props.otherPVs} title='PVs' showHeader />
                )
            }

            return (
                <Section>
                    <Divider />
                    <PVList pvs={this.props.originalPVs} title={i18n.originalPVs} showHeader />
                    {(this.props.otherPVs.length > 0) && <Expander content={<PVList pvs={this.props.otherPVs} title={i18n.other} showHeader />} />}
                </Section>
            )
        }

        const renderAlbumList = () => (
            <Section>
                <Divider />
                <AlbumHorizontalList albums={this.props.albums} onPressItem={this.props.onPressAlbum} />
            </Section>
        )

        const renderWebLinkList = () => (
            <Section>
                <Divider />
                <WebLinkList webLinks={song.webLinks} category='Official' title={i18n.official} />
            </Section>
        )

        const renderAdditionalInfo = () => (
            <Section style={{ flex: 1, flexDirection: 'row', alignItems: 'center', justifyContent: 'space-around', padding: 8, backgroundColor: '#2C486E' }}>
                <View style={{ alignItems: 'center'}}>
                    <View style={{ padding: 4 }}>
                        <Text style={Theme.boxValue}>{translateSongType(song.songType)}</Text>
                    </View>
                    <Text style={Theme.boxTitle}>{i18n.type}</Text>
                </View>
                <View style={{ alignItems: 'center'}}>
                    <View  style={{ padding: 4 }}>
                        <Text style={Theme.boxValue}>{song.ratingScore}</Text>
                    </View>
                    <Text style={Theme.boxTitle}>{i18n.ratingScore}</Text>
                </View>
                <View style={{ alignItems: 'center'}}>
                    <View  style={{ padding: 4 }}>
                        <Text style={Theme.boxValue}>{toMSS(song.lengthSeconds)}</Text>
                    </View>
                    <Text style={Theme.boxTitle}>{i18n.duration}</Text>
                </View>
            </Section>
        )

        const renderActionGroup = () => (
            <Section style={{ flex: 1, flexDirection: 'row', alignItems: 'center', justifyContent: 'space-around' }}>
                {!this.props.isFavoriteSong && <Icon name='md-heart' text={i18n.favorite} onPress={() => this.props.onPressFavorite(song)} />}
                {this.props.isFavoriteSong && <Icon name='md-heart' text={i18n.favorite} color={Theme.buttonActiveColor} onPress={() => this.props.onPressUnfavorite(song)} />}
                <Icon name='md-share' text={i18n.share} onPress={() => this.props.onPressShare(song)} />
                <Icon name='md-globe' text='VocaDB' onPress={() => this.props.onPressToVocaDB(song)} />
            </Section>
        )

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

        const renderOriginalVersion = () => {
            if(!this.props.originalSong) {
                return null;
            }

            let originalSong = this.props.originalSong;

            return (
                <Section>
                    <Text style={[Theme.subhead, { padding: 8 } ]}>{i18n.original}</Text>
                    <SongRow key={originalSong.id}
                             image={originalSong.image}
                             name={originalSong.name}
                             artist={originalSong.artistString}
                             dateTime={originalSong.createDate}
                             pvServices={(originalSong.pvServices)? originalSong.pvServices.split(',').map(pvService => pvService.trim()) : []}
                             onPress={() => this.props.onPressSong(originalSong)} />
                </Section>
            )
        }

        const renderPlayer = () => {

            const defaultElement = (
                <Cover
                    imageUri={song.image}
                    title={song.name}
                    subtitle={song.artistString}
                    subtitle2={(song && song.publishDate)? moment(song.publishDate).format('MM/DD/YYYY') : '' }
                />
            );

            if(!song.pvs || !song.pvs.length) {
                return defaultElement;
            }

            let officialPvs = song.pvs.filter(p => p.service === 'Youtube' && p.pvType === 'Original')

            if(officialPvs && officialPvs.length) {
                return (
                    <YouTubePlayer pvId={officialPvs[0].pvId} />
                )
            }

            officialPvs = song.pvs.filter(p => p.service === 'Bilibili' && p.pvType === 'Original')

            if(officialPvs && officialPvs.length && officialPvs[0].extendedMetadata && officialPvs[0].extendedMetadata.json) {
                const metaData = JSON.parse(officialPvs[0].extendedMetadata.json)

                if(metaData.Cid) {
                    return (
                        <BBPlayer pvId={officialPvs[0].pvId} cid={metaData.Cid} />
                    )
                }
            }

            officialPvs = song.pvs.filter(p => p.service === 'SoundCloud' && p.pvType === 'Original')

            if(officialPvs && officialPvs.length) {
                return (
                    <SoundCloudPlayer pvId={officialPvs[0].pvId} />
                )
            }



            return defaultElement;
        }

        return (
            <ScrollableTabView>
                <ScrollView style={{ flex: 1, backgroundColor: 'white', paddingBottom: 18 }} tabLabel={i18n.info} >

                    {renderPlayer()}

                    {renderAdditionalInfo()}

                    {renderActionGroup()}

                    {renderExpandableContent()}

                    {song.tags && song.tags.length > 0 && renderTagGroup()}
                    {song.pvs && song.pvs.length > 0 && renderPVList()}
                    {renderOriginalVersion()}
                    {song.albums && song.albums.length > 0 && renderAlbumList()}
                    {song.webLinks && song.webLinks.length > 0 && renderWebLinkList()}

                </ScrollView>
                <ArtistRoleListPage tabLabel={i18n.artists} />
                {song.lyrics && song.lyrics.length > 0 && <LyricGropuPage tabLabel={i18n.lyrics} />}
            </ScrollableTabView>
        )
    }
}

SongDetail.detaulProps = {
}

export default SongDetail