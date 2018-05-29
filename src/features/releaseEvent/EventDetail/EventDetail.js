import React from 'react'
import ScrollableTabView from 'react-native-scrollable-tab-view'
import { View, Text, Image } from 'react-native'
import Icon from '../../../components/Icon/index'
import { ListItem } from 'react-native-material-ui';
import { SongRowList } from '../../song/songHOC'
import AlbumGridView from '../../album/AlbumGridView'
import Content from '../../../components/Content/index'
import Theme from '../../../theme'
import moment from 'moment'
import WebLinkList from '../../webLink/WebLinkList'
import ArtistRoleList from '../../artistRole/ArtistRoleList'
import { Button } from 'react-native-material-ui'

class EventDetail extends React.Component {

    state = {
        shouldRender: false
    }

    componentDidMount () {
        const { params } = this.props.navigation.state
        if(params) {
            this.props.fetchEvent(params.id)
        }

        setTimeout(() => { this.setState({ shouldRender: true }) }, 0)
    }

    render () {
        const event = this.props.event
        const artists = this.props.artists;

        if(!event || !this.state.shouldRender) {
            return (<View></View>)
        }

        const webLinks = (event.webLinks)? event.webLinks : []
        // const imageUrl = (event.mainPicture) ? event.mainPicture.urlThumb.replace('mainThumb', 'mainOrig')
        //     : 'https://via.placeholder.com/350x150/000000/ffffff?text=EVENT';

        const RenderOrNull = props => {
            if(props.shouldRender) {
                return (
                    <View style={{ padding: 8 }}>
                        {props.children}
                    </View>
                )
            }

            return null;
        }

        const SectionHeader = props => (<Text style={[Theme.subhead, { marginVertical: 8 }]}>{props.text}</Text>)

        const renderInfoPage = (
            <Content tabLabel='Info'>
                <View style={{ height: 240, justifyContent: 'center' }}>
                    <Image
                        style={{ flex: 1, margin: 24 }}
                        source={{ uri: event.image }}
                        resizeMode='contain'
                    />
                </View>
                <View>
                    <Text style={[Theme.title, { alignSelf: 'center', margin: 8 }]}>{event.name}</Text>

                    <RenderOrNull shouldRender={(event && event.date)}>
                        <SectionHeader text='Date' />
                        <Text style={Theme.body}>{moment(event.date).format('dddd, MMMM Do YYYY')}</Text>
                    </RenderOrNull>

                    <RenderOrNull shouldRender={(event && event.venueName)}>
                        <SectionHeader text='Venue' />
                        <Text style={Theme.body}>{event.venueName}</Text>
                    </RenderOrNull>

                    <RenderOrNull shouldRender={(event && event.category)}>
                        <SectionHeader text='Category' />
                        <Text style={Theme.body}>{event.category}</Text>
                    </RenderOrNull>

                    <RenderOrNull shouldRender={(event && event.description)}>
                        <SectionHeader text='Description' />
                        <Text style={Theme.body}>{event.description}</Text>
                    </RenderOrNull>

                    <RenderOrNull shouldRender={(webLinks && webLinks.length)}>
                        <SectionHeader text='Related links' />
                        <WebLinkList webLinks={webLinks} />
                    </RenderOrNull>

                    <Button onPress={() => this.props.onPressToVocaDB(event)} primary text="View more on VocaDB site" />
                    <View style={{ height: 18 }} />
                </View>
            </Content>
        )

        const SongListPage = () => (
            <Content>
                <SongRowList data={this.props.songs} onPressItem={this.props.onPressSong} />
            </Content>
        )

        const ArtistRoleListPage = () => (
            <Content>
                <ArtistRoleList artists={artists} onPressItem={this.props.onPressArtist} groupBy='effectiveRoles' displayRole />
            </Content>
        )

        const AlbumListPage = () => (
            <Content>
                <AlbumGridView albums={this.props.albums} onPressItem={this.props.onPressAlbum} />
            </Content>
        )

        const hasSong = (this.props.songs && this.props.songs.length)? true : false
        const hasAlbum = (this.props.albums && this.props.albums.length)? true : false
        const hasArtist = (artists && artists.length > 0)? true : false;

        if(!hasSong && !hasAlbum) {
            return renderInfoPage
        }

        return (
            <ScrollableTabView>
                {renderInfoPage}
                {hasArtist && <ArtistRoleListPage tabLabel={`Artists (${artists.length})`} />}
                {hasSong && <SongListPage tabLabel={`Songs (${this.props.songs.length})`} />}
                {hasAlbum && <AlbumListPage tabLabel={`Albums (${this.props.albums.length})`} />}
            </ScrollableTabView>
        )
    }
}

export default EventDetail