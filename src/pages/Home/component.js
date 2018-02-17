import React from 'react'
import { View, Text, Button, ScrollView, RefreshControl } from 'react-native'
import SongList from '../../components/SongList'
import AlbumList from '../../components/AlbumList'
import ScrollableTabView from 'react-native-scrollable-tab-view'
import CustomTabBar from './../../components/CustomTabBar'
import mockEvent from './../../components/EventList/mock'
import EventList from './../../components/EventList'

export default class HomePage extends React.Component {

    componentDidMount () {
        this.refresh()
    }

    refresh () {
        this.props.fetchRecentSongs()
        this.props.fetchPopularSongs()
        this.props.fetchLatestEvents()
    }

    render () {

        const HomeTabPage = () => (
            <ScrollView refreshControl={
                <RefreshControl
                    refreshing={this.props.refreshing}
                    onRefresh={this.refresh.bind(this)}
                />}>
                <SongList title='Recent songs' max={5} showHeader={true} songs={this.props.recentSongs} onPressItem={this.props.onPressSong} hideMoreButton={true} />
                <SongList title='Popular songs' max={5} showHeader={true} songs={this.props.popularSongs} onPressItem={this.props.onPressSong} />
                <AlbumList title='Recent albums' max={10} horizontal={true} showHeader={true} albums={this.props.popularAlbums} onPressItem={this.props.onPressSong} />
            </ScrollView>
        )

        const EventTabPage = () => (
            <ScrollView>
                <EventList events={this.props.latestEvents} />
            </ScrollView>
        )

        return (
            <ScrollableTabView renderTabBar={() => <CustomTabBar />}>
                <HomeTabPage tabLabel="ios-home" />
                <View tabLabel="ios-search"><Text>Search</Text></View>
                <EventTabPage tabLabel="ios-calendar"></EventTabPage>
                <View tabLabel="ios-menu"><Text>Menu</Text></View>
            </ScrollableTabView>
        )
    }
}