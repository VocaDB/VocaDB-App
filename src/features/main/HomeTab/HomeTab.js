import React from 'react'
import { View, Text, TouchableOpacity, StyleSheet, RefreshControl, SectionList, FlatList, ScrollView } from 'react-native'
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
            <TouchableOpacity style={{ alignItems: 'center', flex: 1, margin: 8 }} onPress={props.onPress}>
                <Avatar icon={props.icon} style={{ container: { backgroundColor: props.color, margin: 4 } }}  />
                <Text style={Theme.caption}>{props.text}</Text>
            </TouchableOpacity>
        )

        const renderSongCard = song => (
            <SongCard key={song.id}
                      id={song.id}
                      name={song.name}
                      artist={song.artistString}
                      image={song.image}
                      pvs={song.pvs}
                      songType={song.songType}
                      onPress={() => this.props.onPressSong(song)} />
        )

        const renderAlbumCard = album => (
            <AlbumCard key={album.id}
                       id={album.id}
                       name={album.name}
                       image={album.image}
                       onPress={() => this.props.onPressAlbum(album)} />
        )

        const renderEventCard = event => {
            return (
                <EventCard  key={event.id}
                            name={event.name}
                            thumbnail={event.image}
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
                    <ScrollView horizontal showsHorizontalScrollIndicator={false} style={{ backgroundColor: 'white' }}>
                        <MenuIcon icon='music-note' color='#00C853' text='Songs' onPress={this.props.onPressSongSearch} />
                        <MenuIcon icon='person' color='#d50000' text='Artists' onPress={this.props.onPressArtistSearch} />
                        <MenuIcon icon='album' color='#283593' text='Albums' onPress={this.props.onPressAlbumSearch} />
                        <MenuIcon icon='event' color='#FFD600' text='Events' onPress={this.props.onPressEventSearch} />
                        <MenuIcon icon='label' color='#6D4C41' text='Tags' onPress={this.props.onPressTagSearch} />
                    </ScrollView>

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