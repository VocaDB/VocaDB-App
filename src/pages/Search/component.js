import React from 'react'
import { View, Text, ScrollView, StatusBar, Button } from 'react-native'
import { Toolbar } from 'react-native-material-ui';
import EntryList from './../../components/EntryList'
import ArtistList from './../../components/ArtistList'
import AlbumList from './../../components/AlbumList'
import Page from './../../components/Page'
import PropTypes from 'prop-types'
import SearchBar from './../../components/SearchBar'

class SearchPage extends React.Component {

    renderResultNotFound () {
        return (
            <View>
                <Text>Result not found</Text>
            </View>
        )
    }

    renderRecentList () {
        return (
            <ScrollView style={{ flex: 1 }}>
                <EntryList title='Recently search' entries={this.props.recentList} onPressItem={this.props.onPressEntry} />
                <Button title='Clear' onPress={this.props.onPressClearRecent} />
            </ScrollView>
        )
    }

    renderResult () {
        if(!this.props.hasResult) {
            return this.renderResultNotFound()
        }

        const songEntries = this.props.entries.filter(entry => entry.entryType === 'Song')
        const artistEntries = this.props.entries.filter(entry => entry.entryType === 'Artist')
        const albumEntries = this.props.entries.filter(entry => entry.entryType === 'Album')
        const eventEntries = this.props.entries.filter(entry => entry.entryType === 'ReleaseEvent')
        const tagEntries = this.props.entries.filter(entry => entry.entryType === 'Tag')

        const ResultContent = () => (
            <ScrollView style={{ flex: 1 }}>
                {songEntries.length > 0 && <EntryList title='Songs' entries={songEntries} onPressItem={this.props.onPressEntry} />}
                {artistEntries.length > 0 && <ArtistList artists={artistEntries} onPressItem={this.props.onPressEntry} />}
                {albumEntries.length > 0 && <AlbumList albums={albumEntries} onPressItem={this.props.onPressEntry} showHeader />}
                {eventEntries.length > 0 && <EntryList title='Events' entries={eventEntries} onPressItem={this.props.onPressEntry} />}
                {tagEntries.length > 0 && <EntryList title='Tags' entries={tagEntries} onPressItem={this.props.onPressEntry} />}
            </ScrollView>
        )

        return <ResultContent />
    }


    render () {
        return (
            <Page>
                <SearchBar
                    onLeftElementPress={this.props.back}
                    onRightElementPress={this.props.clearSearch}
                    onChangeText={text => {
                        if(text) {
                            this.props.searchEntries(text)
                        } else {
                            this.props.clearSearch()
                        }
                    }}
                />
                <View style={{ backgroundColor: 'white', flex: 1 }}>
                    {(this.props.searching) ? this.renderResult() : this.renderRecentList()}
                </View>
            </Page>
        )
    }
}

SearchPage.propTypes = {
    entries: PropTypes.array,
    hasResult: PropTypes.bool,
    loading: PropTypes.bool,
    searching: PropTypes.bool,
    recentList: PropTypes.array
}

export default SearchPage
