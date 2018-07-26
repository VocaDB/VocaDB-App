import React from 'react';
import { View, Text, ScrollView, StatusBar } from 'react-native';
import { Toolbar } from 'react-native-material-ui';
import EntryList from '../EntryList/index';
import ArtistList from '../../artist/ArtistList/index';
import EventList from '../../releaseEvent/EventList';
import AlbumList from '../../album/AlbumList/index';
import Page from '../../../components/Page/index';
import PropTypes from 'prop-types';
import SearchBar from '../../../components/SearchBar/index';
import { Button } from 'react-native-material-ui';
import Theme from '../../../theme';
import Empty from './../../../components/Empty';
import i18n from './../../../common/i18n';

class EntrySearch extends React.Component {

    constructor(props) {
        super(props)
        this.state = {
            query: ''
        }
    }

    componentDidMount () {
    }

    onSearch(query) {
        this.setState({ query });
    }

    renderResultNotFound () {
        return (
            <View style={{ alignItems: 'center'}}>
                <Text>Result not found</Text>
            </View>
        )
    }

    renderRecentList () {

        const renderClearButton = () => {
            if(this.props.recentList && this.props.recentList.length > 0) {
                return (<Button primary text="Clear" onPress={this.props.onPressClearRecent} />)
            }

            return null;
        }
        return (
            <ScrollView style={{ flex: 1 }}>
                <View style={{ padding: 8, flexDirection: 'row', justifyContent: 'space-between', alignItems: 'center'}}>
                    <Text style={Theme.subhead}>{i18n.recentSearch}</Text>
                    {renderClearButton()}
                </View>
                <EntryList entries={this.props.recentList} onPressItem={this.props.onPressEntry} />
            </ScrollView>
        )
    }

    renderDefault () {
        return (
            <Empty text='Find anything here' icon='ios-search' />
        )
    }

    renderFinding () {
        return (
            <View style={{ alignItems: 'center' }}>
                <Text>Finding....</Text>
            </View>
        )
    }

    renderResult () {
        const hasEntries = (this.props.entries && this.props.entries.length > 0)? true : false;
        const hasRecentList = (this.props.recentList && this.props.recentList.length > 0)? true : false;
        const searching = (this.state.query)? true : false;

        if(this.props.loading && !hasEntries) {
            return this.renderFinding();
        }

        if(!searching && !hasRecentList) {
            return this.renderDefault()
        }

        if(!searching && hasRecentList) {
            return this.renderRecentList()
        }

        if(searching && !hasEntries) {
            return this.renderResultNotFound()
        }

        const songEntries = this.props.entries.filter(entry => entry.entryType === 'Song')
        const artistEntries = this.props.entries.filter(entry => entry.entryType === 'Artist')
        const albumEntries = this.props.entries.filter(entry => entry.entryType === 'Album')
        const eventEntries = this.props.entries.filter(entry => entry.entryType === 'ReleaseEvent')
        const tagEntries = this.props.entries.filter(entry => entry.entryType === 'Tag')

        const ResultContent = () => (
            <ScrollView style={{ flex: 1 }}>
                {songEntries.length > 0 && <EntryList max={5} title={i18n.songs} entries={songEntries} onPressItem={this.props.onPressEntry} onPressMore={() => this.props.onPressMoreSong(this.props.query)} />}
                {artistEntries.length > 0 && <ArtistList artists={artistEntries} onPressItem={this.props.onPressEntry} showHeader={true} />}
                {albumEntries.length > 0 && <AlbumList albums={albumEntries} onPressItem={this.props.onPressEntry} showHeader />}
                {eventEntries.length > 0 &&  <EventList
                    title={i18n.events}
                    events={eventEntries}
                    onPressItem={this.props.onPressEntry}
                    hideMoreButton={true} />}
                {tagEntries.length > 0 && <EntryList title={i18n.tags} entries={tagEntries} onPressItem={this.props.onPressEntry} />}
            </ScrollView>
        )

        return <ResultContent />
    }


    render () {
        return (
            <Page>
                <SearchBar
                    text={this.state.query}
                    onLeftElementPress={this.props.back}
                    onRightElementPress={() => {
                        this.onSearch('')
                        this.props.clearSearch()
                    }}
                    onChangeText={text => {
                        this.onSearch(text)
                        if(text) {
                            this.props.searchEntries(text)
                        } else {
                            this.props.clearSearch()
                        }
                    }}
                />
                <View style={{ backgroundColor: 'white', flex: 1 }}>
                    {this.renderResult()}
                </View>
            </Page>
        )
    }
}

EntrySearch.propTypes = {
    entries: PropTypes.array,
    hasResult: PropTypes.bool,
    loading: PropTypes.bool,
    searching: PropTypes.bool,
    recentList: PropTypes.array
}

EntrySearch.defaultProps = {
    entries: [],
    hasResult: false,
    loading: false,
    searching: false,
    recentList: [],
    clearSearch: () => console.log('clear search'),
    onPressEntry: () => console.log('on press entry'),
    onPressClearRecent: () => console.log('on press clear recent')

}

export default EntrySearch
