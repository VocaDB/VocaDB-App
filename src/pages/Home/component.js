import React from 'react'
import { View, Text, ScrollView, RefreshControl } from 'react-native'
import SongList from '../../components/SongList'
import AlbumList from '../../components/AlbumList'
import ScrollableTabView from 'react-native-scrollable-tab-view'
import CustomTabBar from './../../components/CustomTabBar'
import mockEvent from './../../components/EventList/mock'
import EventList from './../../components/EventList'
import Content from './../../components/Content'
import CenterView from './../../components/CenterView'
import Icon from './../../components/Icon'
import { ListItem, Button } from 'react-native-material-ui';
import Theme from './../../theme'

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
                    footer={<Button primary text="See more" onPress={this.props.onPressMoreRecentSongs} />} />
                <AlbumList title='Recent albums' max={10} horizontal={true} showHeader={true} albums={this.props.recentAlbums} onPressItem={this.props.onPressAlbum} />
            </Content>
        )

        const EventTabPage = () => (
            <ScrollView>
                <EventList events={this.props.latestEvents} onPressItem={this.props.onPressEvent} />
            </ScrollView>
        )

        const MenuTabPage =() => (
            <View style={{ flex: 1 }}>
                <CenterView>
                    <Text style={[Theme.subhead,{ margin: 8 }]}>This app is still under development.</Text>
                    <Button raised text="Sign in" />
                </CenterView>
                <View style={{ flex: 1, backgroundColor: 'white' }}>
                    <ListItem
                        leftElement={<Icon name='ios-settings' />}
                        centerElement={{
                            primaryText: 'Settings',
                        }}
                        onPress={() => {}}
                    />
                    <ListItem
                        leftElement={<Icon name='ios-lock' />}
                        centerElement={{
                            primaryText: 'Terms & privacy policy',
                        }}
                        onPress={() => {}}
                    />
                    <ListItem
                        leftElement={<Icon name='ios-help-circle' />}
                        centerElement={{
                            primaryText: 'Help & feedback',
                        }}
                        onPress={() => {}}
                    />
                </View>
            </View>
        )

        return (
            <ScrollableTabView renderTabBar={() => <CustomTabBar />}>
                <HomeTabPage tabLabel="ios-home" />
                <EventTabPage tabLabel="ios-calendar"></EventTabPage>
                <MenuTabPage tabLabel="ios-menu"></MenuTabPage>
            </ScrollableTabView>
        )
    }
}