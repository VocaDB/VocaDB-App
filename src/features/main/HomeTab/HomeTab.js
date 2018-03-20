import React from 'react'
import { View, Text, TouchableOpacity, StyleSheet, RefreshControl } from 'react-native'
import { Avatar } from 'react-native-material-ui';
import PropTypes from 'prop-types'
import FeatureList from './../FeatureList'
import Theme from '../../../theme'
import Content from '../../../components/Content'
import Divider from '../../../components/Divider'
import SongCard from '../../song/SongCard'
import AlbumCard from '../../album/AlbumCard'
import EventCard from '../../releaseEvent/EventCard'


class HomeTab extends React.Component {
    render () {

        const MenuIcon = (props) => (
            <TouchableOpacity style={{ alignItems: 'center' }} onPress={props.onPress}>
                <Avatar icon={props.icon} style={{ container: { backgroundColor: props.color } }}  />
                <Text style={Theme.caption}>{props.text}</Text>
            </TouchableOpacity>
        )

        const renderSongCard = song => (
            <SongCard key={song.id}
                      id={song.id}
                      name={song.defaultName}
                      artist={song.artistString}
                      image={song.thumbUrl}
                      pvs={song.pvs}
                      onPress={() => this.props.onPressSong(song)} />
        )

        const renderAlbumCard = album => (
            <AlbumCard key={album.id}
                       id={album.id}
                       name={album.name}
                       onPress={() => this.props.onPressAlbum(album)} />
        )

        const renderEventCard = event => {
            const thumbnailUrl = (event.mainPicture) ? event.mainPicture.urlThumb.replace('mainThumb', 'mainOrig') : undefined
            return (
                <EventCard  key={event.id}
                            name={event.name}
                            thumbnail={thumbnailUrl}
                            location={event.venueName}
                            date={event.date}
                            onPress={() => this.props.onPressEvent(event)} />
            )
        }


        const renderFeatureList = (title, items, renderItem, onPressMore) => (
            <FeatureList
                title={title}
                items={items.map(renderItem)}
                onPressMore={this.props.onPressMoreRecentSongs} />
        )

        const refreshControl = (
            <RefreshControl
                refreshing={this.props.refreshing}
                onRefresh={this.props.refresh}
            />
        )

        return (
            <Content refreshControl={refreshControl}>
                <View style={[styles.menuContainer]}>
                    <MenuIcon icon='music-note' color='#00C853' text='Song' onPress={this.props.onPressSongSearch} />
                    <MenuIcon icon='person' color='#d50000' text='Artist' onPress={this.props.onPressArtistSearch} />
                    <MenuIcon icon='album' color='#283593' text='Album' onPress={this.props.onPressAlbumSearch} />
                    <MenuIcon icon='event' color='#FFD600' text='Event' onPress={this.props.onPressEventSearch} />
                </View>

                <Divider height={14} />

                <View style={{ paddingBottom: 16}}>
                    {renderFeatureList('Highlighted PVs', this.props.recentSongs, renderSongCard, this.props.onPressMoreRecentSongs)}

                    <Divider height={14} />

                    {renderFeatureList('Recent or upcoming albums', this.props.recentAlbums, renderAlbumCard, this.props.onPressMoreRecentAlbums)}

                    <Divider height={14} />

                    {renderFeatureList('Random popular albums', this.props.topAlbums, renderAlbumCard, this.props.onPressMoreTopAlbums)}

                    <Divider height={14} />

                    {renderFeatureList('Incoming event', this.props.latestEvents, renderEventCard, this.props.onPressMoreLatestEvent)}

                    <Divider height={14} />
                </View>
            </Content>
        )
    }
}

const styles = StyleSheet.create({
    menuContainer: {
        flexDirection: 'row',
        height: 72,
        justifyContent: 'space-around',
        marginVertical: 16
    }
})

HomeTab.propTypes = {
    refreshing: PropTypes.bool,
    refresh: PropTypes.func,
    onPressSong: PropTypes.func,
    onPressAlbum: PropTypes.func,
    onPressEvent: PropTypes.func,
    onPressSongSearch: PropTypes.func,
    onPressArtistSearch: PropTypes.func,
    onPressAlbumSearch: PropTypes.func,
    onPressEventSearch: PropTypes.func,
    onPressMoreRecentSongs: PropTypes.func,
    onPressMoreRecentAlbums: PropTypes.func,
    onPressMoreLatestEvent: PropTypes.func,
    onPressMoreTopAlbums: PropTypes.func
}

HomeTab.defaultProps = {
    refreshing: false,
    refresh: () => console.log('Home refresh'),
    recentSongs: [],
    recentAlbums: [],
    topAlbums: [],
    latestEvents: []
}

export default HomeTab