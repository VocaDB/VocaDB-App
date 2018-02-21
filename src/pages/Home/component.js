import React from 'react'
import { View, Text, Button, ScrollView, RefreshControl } from 'react-native'
import SongList from '../../components/SongList'
import AlbumList from '../../components/AlbumList'
import ScrollableTabView from 'react-native-scrollable-tab-view'
import CustomTabBar from './../../components/CustomTabBar'
import mockEvent from './../../components/EventList/mock'
import EventList from './../../components/EventList'
import Content from './../../components/Content'

export default class HomePage extends React.Component {

    componentDidMount () {
        this.refresh()
    }

    refresh () {
        this.props.fetchRecentSongs()
        this.props.fetchPopularSongs()
        this.props.fetchLatestEvents()
        this.props.fetchRecentAlbums()
    }

    render () {

        const HomeTabPage = () => (
            <Content refreshControl={
                <RefreshControl
                    refreshing={this.props.refreshing}
                    onRefresh={this.refresh.bind(this)}
                />}>
                <SongList
                    title='Recent songs'
                    max={5} showHeader={true}
                    songs={this.props.recentSongs}
                    onPressItem={this.props.onPressSong}
                    hideMoreButton={true}
                    footer={<Button style={{ backgroundColor: 'transparent' }} title='More' onPress={this.props.onPressMoreRecentSongs} />} />
                <AlbumList title='Recent albums' max={10} horizontal={true} showHeader={true} albums={this.props.recentAlbums} onPressItem={this.props.onPressAlbum} />
            </Content>
        )

        const EventTabPage = () => (
            <ScrollView>
                <EventList events={this.props.latestEvents} />
            </ScrollView>
        )

        return (
            <ScrollableTabView renderTabBar={() => <CustomTabBar />}>
                <HomeTabPage tabLabel="ios-home" />
                <EventTabPage tabLabel="ios-calendar"></EventTabPage>
                <View tabLabel="ios-menu"><Text>Menu</Text></View>
            </ScrollableTabView>
        )
    }
}