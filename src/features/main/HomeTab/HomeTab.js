import React from 'react';
import { View, Text, TouchableOpacity, StyleSheet, RefreshControl, SectionList, FlatList, ScrollView, Dimensions } from 'react-native';
import { Avatar } from 'react-native-material-ui';
import PropTypes from 'prop-types';
import FeatureList from './../FeatureList';
import EventSongList from './../EventSongList';
import Theme from '../../../theme';
import SongCard from '../../song/SongCard';
import AlbumCard from '../../album/AlbumCard';
import EventCard from '../../releaseEvent/EventCard';
import i18n from './../../../common/i18n';


class HomeTab extends React.PureComponent {
    render () {

        const MenuIcon = (props) => (
            <TouchableOpacity style={{ alignItems: 'center', flex: 1, margin: 8 }} onPress={props.onPress}>
                <Avatar icon={props.icon} style={{ container: { backgroundColor: props.color, margin: 4 } }}  />
                <Text style={[Theme.caption, { textAlign: 'center' }]} textBreakStrategy='balanced'>{props.text}</Text>
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


        const renderFeatureList = (title, image, items, renderItem, onPressMore) => {
            return (image) ?
                (<EventSongList
                    title={title}
                    items={items}
                    image={image}
                    renderItem={renderItem}
                    onPressMore={onPressMore}/>) :

                (<FeatureList title={title}
                              items={items}
                              renderItem={renderItem}
                              onPressMore={onPressMore}/>);
        }


        const HomeHeader = props => {

            if(Dimensions.get('screen').width < 360) {
                return (
                    <ScrollView horizontal showsHorizontalScrollIndicator={false} style={{ backgroundColor: 'white' }}>
                        {props.children}
                    </ScrollView>
                )
            }

            return (
                <View style={{ backgroundColor: 'white', justifyContent: 'center', alignItems: 'center', flexDirection: 'row' }}>
                    {props.children}
                </View>
            )

        }

        const events = this.props.anniversaryEvents.map(e => {
            return {
                key: e.id,
                type: 'event',
                title: e.name,
                image: e.image,
                data: e.songs,
                renderItem: renderSongCard,
                onPressMore: () => {
                    this.props.onPressEvent(e)
                }
            }
        })

        return (
            <FlatList
                refreshing={this.props.refreshing}
                onRefresh={this.props.refresh}
                ListHeaderComponent={(
                    <HomeHeader>
                        <MenuIcon icon='music-note' color='#00C853' text={i18n.songs} onPress={this.props.onPressSongSearch} />
                        <MenuIcon icon='person' color='#d50000' text={i18n.artists} onPress={this.props.onPressArtistSearch} />
                        <MenuIcon icon='album' color='#283593' text={i18n.albums} onPress={this.props.onPressAlbumSearch} />
                        <MenuIcon icon='event' color='#FFD600' text={i18n.events} onPress={this.props.onPressEventSearch} />
                        <MenuIcon icon='label' color='#6D4C41' text={i18n.tags} onPress={this.props.onPressTagSearch} />
                    </HomeHeader>

                )}
                renderItem={({ item }) => renderFeatureList(item.title, item.image, item.data, item.renderItem, item.onPressMore)}
                ItemSeparatorComponent={() => <View style={{ height: 6, backgroundColor: 'white' }} />}
                data={[
                    ...events,
                    {
                        key: 0,
                        title: i18n.highlightPVs,
                        data: this.props.recentSongs,
                        renderItem: renderSongCard,
                        onPressMore: this.props.onPressMoreRecentSongs
                    },

                    {
                        key: 1,
                        title: i18n.recentAlbums,
                        data: this.props.recentAlbums,
                        renderItem: renderAlbumCard,
                        onPressMore: this.props.onPressMoreRecentAlbums
                    },
                    {
                        key: 2,
                        title: i18n.randomPopularAlbums,
                        data: this.props.topAlbums,
                        renderItem: renderAlbumCard,
                        onPressMore: this.props.onPressMoreTopAlbums
                    },
                    {
                        key: 3,
                        title: i18n.upcomingEvent,
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
    latestEvents: [],
    anniversaryEvents: []
}

export default HomeTab