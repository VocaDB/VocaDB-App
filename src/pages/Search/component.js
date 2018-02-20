import React from 'react'
import { View, Text, ScrollView, StatusBar } from 'react-native'
import CenterView from './../../components/CenterView'
import { Toolbar } from 'react-native-material-ui';
import EntryList from './../../components/EntryList'
import SongList from './../../components/SongList'
import ArtistList from './../../components/ArtistList'
import AlbumList from './../../components/AlbumList'
import Page from './../../components/Page'
import { material } from 'react-native-typography'
import { SafeAreaView } from 'react-navigation';
import { Constants } from 'expo'
import Icon from './../../components/Icon'
import { statusBarColor, rootBackgroundColor } from './../../theme'

class SearchPage extends React.Component {

    render () {

        const songEntries = this.props.entries.filter(entry => entry.entryType === 'Song')
        const artistEntries = this.props.entries.filter(entry => entry.entryType === 'Artist')
        const albumEntries = this.props.entries.filter(entry => entry.entryType === 'Album')

        const ResultContent = () => (
            <ScrollView style={{ flex: 1 }}>
                {songEntries.length > 0 && <EntryList title='Songs' entries={songEntries} onPressItem={this.props.onPressEntry} />}
                {artistEntries.length > 0 && <ArtistList artists={artistEntries} onPressItem={this.props.onPressEntry} />}
                {albumEntries.length > 0 && <AlbumList albums={albumEntries} onPressItem={this.props.onPressEntry} showHeader />}
            </ScrollView>
        )

        return (
            <Page>
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
                <View style={{ backgroundColor: 'white', flex: 1 }}>
                    {<ResultContent/>}
                </View>
            </Page>
        )
    }
}

export default SearchPage
