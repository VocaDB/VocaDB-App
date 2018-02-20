import React from 'react'
import { View, Text, ScrollView, StatusBar } from 'react-native'
import CenterView from './../../components/CenterView'
import { Toolbar } from 'react-native-material-ui';
import EntryList from './../../components/EntryList'
import SongList from './../../components/SongList'
import ArtistList from './../../components/ArtistList'
import AlbumList from './../../components/AlbumList'
import Header from './../../components/Header'
import { material } from 'react-native-typography'
import { SafeAreaView } from 'react-navigation';
import { Constants } from 'expo'
import Icon from './../../components/Icon'
import { statusBarColor, rootBackgroundColor } from './../../theme'

class SearchPage extends React.Component {

    render () {

        // entry type
        const songEntries = this.props.entries.filter(entry => entry.entryType === 'Song')
        const artistEntries = this.props.entries.filter(entry => entry.entryType === 'Artist')
        const albumEntries = this.props.entries.filter(entry => entry.entryType === 'Album')

        const BlankContent = () => (
            <CenterView>
                <View>
                    <Text style={material.body1}>Find anything here</Text>
                </View>
            </CenterView>
        )

        const Resultcontent = () => (
            <ScrollView style={{ flex: 1 }}>
                <EntryList title='Songs' entries={songEntries} onPressItem={this.props.onPressEntry} />
                <ArtistList artists={artistEntries} onPressItem={this.props.onPressEntry} />
                <AlbumList albums={albumEntries} onPressItem={this.props.onPressEntry} showHeader />
            </ScrollView>

        )

        return (
            <View style={{ backgroundColor: statusBarColor, flex: 1 }}>
                <Header>
                    <Toolbar
                        leftElement="arrow-back"
                        centerElement='Search'
                        searchable={{
                            autoFocus: true,
                            onChangeText: text => {
                                if(text) {
                                    this.props.searchEntries(text)
                                } else {
                                    this.props.clearSearch()
                                }
                            },
                            onSearchClosed: this.props.clearSearch
                        }}
                        onLeftElementPress={this.props.back}
                        onRightElementPress={this.props.clearSearch}
                    />
                </Header>
                <View style={{ backgroundColor: 'white', flex: 1 }}>
                    {this.props.entries && <Resultcontent/>}
                    {!this.props.entries.length && <BlankContent/>}
                </View>
            </View>
        )
    }
}

export default SearchPage
