import React from 'react'
import ScrollableTabView from 'react-native-scrollable-tab-view'
import { View, Text, Image } from 'react-native'
import Icon from '../../../components/Icon/index'
import { ListItem } from 'react-native-material-ui';
import SongList from '../../song/SongList'
import AlbumGridView from '../../album/AlbumGridView'
import Content from '../../../components/Content/index'
import Theme from '../../../theme'
import moment from 'moment'

class EventDetail extends React.Component {

    componentDidMount () {
        const { params } = this.props.navigation.state
        if(params) {
            this.props.fetchEvent(params.id)
        }
    }

    render () {
        const event = this.props.event

        if(!event) {
            return (<View></View>)
        }

        const webLinks = (event.webLinks)? event.webLinks : []
        const imageUrl = (event.mainPicture) ? event.mainPicture.urlThumb.replace('mainThumb', 'mainOrig')
            : 'http://via.placeholder.com/350x150/000000/ffffff/NO_IMAGE';

        const renderRowInfo = (icon, value, onPress) => (
            <ListItem
                leftElement={<Icon name={icon} />}
                centerElement={{
                    primaryText: value,
                }}
                onPress={() => {}}
            />
        )

        const officialLink = webLinks.find(webLink => webLink.category === 'Official')

        const InfoPage = () => (
            <Content>
                <View style={{ height: 240, justifyContent: 'center' }}>
                    <Image
                        style={{ flex: 1, margin: 24 }}
                        source={{ uri: imageUrl }}
                        resizeMode='contain'
                    />
                </View>
                <View>
                    <Text style={[Theme.title, { alignSelf: 'center', margin: 8 }]}>{event.name}</Text>
                    {event.description && <Text style={[Theme.subhead, { alignSelf: 'center', margin: 8 }]}>{event.description}</Text>}

                    {renderRowInfo('ios-calendar', moment(event.date).format('dddd, MMMM Do YYYY'), () => this.props.onPressDate(event.date))}
                    {event.venueName && renderRowInfo('ios-locate', event.venueName, () => this.props.onPressLocation(event.venueName))}
                    {officialLink && renderRowInfo('ios-globe', 'Website', () => this.props.onPressWebsite(officialLink.url))}
                </View>
            </Content>
        )

        const SongListPage = () => (
            <Content>
                <SongList songs={this.props.songs} />
            </Content>
        )

        const AlbumListPage = () => (
            <Content>
                <AlbumGridView albums={this.props.albums} />
            </Content>
        )

        const hasSong = (this.props.songs && this.props.songs.length)? true : false
        const hasAlbum = (this.props.albums && this.props.albums.length)? true : false

        if(!hasSong && !hasAlbum) {
            return <InfoPage />
        }

        return (
            <ScrollableTabView>
                <InfoPage tabLabel='Info' />
                {hasSong && <SongListPage tabLabel={`Songs (${this.props.songs.length})`} />}
                {hasAlbum && <AlbumListPage tabLabel={`Albums (${this.props.albums.length})`} />}
            </ScrollableTabView>
        )
    }
}

export default EventDetail