import React from 'react'
import { View, Text, TouchableOpacity, StyleSheet, RefreshControl, SectionList, FlatList } from 'react-native'
import { Avatar } from 'react-native-material-ui';
import PropTypes from 'prop-types'
import FeatureList from './../FeatureList'
import Theme from '../../../theme'
import Content from '../../../components/Content'
import Divider from '../../../components/Divider'
import SongCard from '../../song/SongCard'
import AlbumCard from '../../album/AlbumCard'
import EventCard from '../../releaseEvent/EventCard'


class HomeTab extends React.PureComponent {
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
                items={items}
                renderItem={renderItem}
                onPressMore={onPressMore} />
        )

        return (
            <FlatList
                refreshing={this.props.refreshing}
                onRefresh={this.props.refresh}
                ListHeaderComponent={(
                            <View style={[styles.menuContainer]}>
                                <MenuIcon icon='music-note' color='#00C853' text='Song' onPress={this.props.onPressSongSearch} />
                                <MenuIcon icon='person' color='#d50000' text='Artist' onPress={this.props.onPressArtistSearch} />
                                <MenuIcon icon='album' color='#283593' text='Album' onPress={this.props.onPressAlbumSearch} />
                                <MenuIcon icon='event' color='#FFD600' text='Event' onPress={this.props.onPressEventSearch} />
                            </View>
                )}
                renderItem={({ item }) => renderFeatureList(item.title, item.data, item.renderItem, item.onPressMore)}
                ItemSeparatorComponent={() => <View style={{ height: 6, backgroundColor: 'white' }} />}
                data={[
                    {
                        key: 0,
                        title: 'Highlighted PVs',
                        data: this.props.recentSongs,
                        renderItem: renderSongCard,
                        onPressMore: this.props.onPressSongSearch
                    },
                    {
                        key: 1,
                        title: 'Recent or upcoming albums',
                        data: this.props.recentAlbums,
                        renderItem: renderAlbumCard,
                        onPressMore: this.props.onPressAlbumSearch
                    },
                    {
                        key: 2,
                        title: 'Random popular albums',
                        data: this.props.topAlbums,
                        renderItem: renderAlbumCard,
                        onPressMore: this.props.onPressAlbumSearch
                    },
                    {
                        key: 3,
                        title: 'Incoming event',
                        data: this.props.latestEvents,
                        renderItem: renderEventCard,
                        onPressMore: this.props.onPressEventSearch
                    }
                ]}
            />
        )
    }
}

const styles = StyleSheet.create({
    menuContainer: {
        backgroundColor: 'white',
        flexDirection: 'row',
        height: 92,
        justifyContent: 'space-around',
        paddingVertical: 12
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