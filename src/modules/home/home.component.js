import React from 'react'
import { View, Text, ScrollView, Alert, Button, RefreshControl } from 'react-native'
import ListContainer from './../../components/ListContainer'
import MediaItem from './../../components/MediaItem';
import EventItem from './../../components/EventItem';

class HomeView extends React.Component {

    componentDidMount() {
        this.fetchData()
    }

    fetchData () {
        this.props.fetchSongs()
        this.props.fetchRecentAlbums()
        this.props.fetchEvents()
    }

    _keyExtractor = (item) => item.id;

    renderRecentSongsSection() {
        let renderItem = (item) => (

            <MediaItem
                key={item.id}
                image={item.thumbUrl}
                onMediaClick={() => this.props.viewSong(item.id)}
                title={item.defaultName}
                subtitle={item.artistString} />
        )

        let renderList =  (
            <View>
                <ListContainer
                    minimum={6}
                    title='Recent songs'
                    items={this.props.songs}
                    displayItem={renderItem}
                />
            </View>

        )

        return renderList
    }

    renderRecentAlbumsSection() {

        let renderItem = (item) => (
            <MediaItem
                key={item.id}
                horizontal={true}
                image={item.mainPicture.urlSmallThumb}
                title={item.defaultName}
                onMediaClick={() => console.log('tap album')}
                subtitle={item.artistString} />
        )

        let renderList =  (
            <View>
                <ListContainer
                    minimum={5}
                    title='Recent album'
                    items={this.props.albums}
                    displayItem={renderItem}
                    horizontal={true}
                />
            </View>

        )

        return renderList
    }

    renderPopularAlbumsSection() {

        let renderItem = (item) => (
            <MediaItem
                key={item.id}
                horizontal={true}
                image={item.mainPicture ? item.mainPicture.urlSmallThumb : ''}
                title={item.defaultName}
                onMediaClick={() => console.log('tap album')}
                subtitle={item.artistString} />
        )

        let renderList =  (
            <View>
                <ListContainer
                    title='Popular album'
                    items={this.props.albums}
                    displayItem={renderItem}
                    horizontal={true}
                />
            </View>

        )

        return renderList
    }

    renderEventsSection() {
        let renderItem = (item) => (
            <EventItem
                key={item.id}
                horizontal={true}
                image={item.mainPicture ? item.mainPicture.urlSmallThumb : 'https://static.vocadb.net/img/releaseevent/mainSmall/1584.png?v=2'}
                title={item.name}
                dateTime={item.date}
                onMediaClick={() => console.log('tap album')}
                subtitle={item.venueName} />
        )

        let renderList =  (
            <View>
                <ListContainer
                    title='Happening now'
                    items={this.props.events}
                    displayItem={renderItem}
                    horizontal={true}
                />
            </View>

        )

        return renderList
    }

    render() {

        const { error } = this.props;

        if(error) {
            Alert.alert('Error', error.message);
        }

        const recentSongsSection = this.renderRecentSongsSection()
        const recentAlbumsSection = this.renderRecentAlbumsSection()
        const popularAlbumsSection = this.renderPopularAlbumsSection()
        const eventsSection = this.renderEventsSection()
        const refreshControl = (<RefreshControl refreshing={this.props.loading} onRefresh={() => this.fetchData()} />)

        return (
            <View style={{
                backgroundColor: 'white',
                flex: 1
            }}>
                <ScrollView style={{
                    flex: 1
                }} refreshControl={refreshControl}>
                    {recentSongsSection}
                    {recentAlbumsSection}
                    {popularAlbumsSection}
                    {eventsSection}
                </ScrollView>
            </View>
        )
    }
}

export default HomeView
