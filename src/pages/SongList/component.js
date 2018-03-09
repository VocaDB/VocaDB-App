import React from 'react'
import { RefreshControl, ScrollView, View, Text, Button, Modal } from 'react-native'
import Icon from './../../components/Icon'
import Page from './../../components/Page'
import Content from './../../components/Content'
import SearchBar from './../../components/SearchBar'
import SongList from '../../modules/song/SongList'
import ArtistSelectModal from '../../modules/artist/ArtistSelectModal'
import Theme from './../../theme'
import merge from "lodash/merge";

export default class SongListPage extends React.Component {

    constructor(props) {
        super(props)
    }

    componentDidMount () {
        this.refresh()
    }

    doSearch(params) {
        this.props.fetchSongs(merge({}, this.props.params, params))
    }

    refresh() {
        const {params} = this.props.navigation.state;

        if(params && params.params) {
            this.doSearch(params.params)
        }
    }

    renderList () {

        return (
            <SongList
                flatList
                title='Recent songs'
                showHeader={false}
                songs={this.props.songs}
                onPressItem={this.props.onPressSong}
                refreshing={this.props.loading}
                onRefresh={this.refresh.bind(this)}
                onEndReached={() => {
                    if(!this.props.isNoResult) {
                        this.doSearch({ start: this.props.songs.length })
                    }
                }}
                hideMoreButton={true} />

        )
    }

    renderSearchable () {
        return (
            <Page>
                <SearchBar
                    onLeftElementPress={this.props.back}
                    onChangeText={text => {
                        this.doSearch({ query: text, start: 0 })
                    }}
                />
                <View style={{ flex: 1, backgroundColor: Theme.contentBackgroundColor, paddingBottom: 8 }}>
                    {this.renderList()}
                </View>
            </Page>
        )
    }

    render () {

        const { params } = this.props.navigation.state;

        if(this.props.searchable || params.searchable) {
            return this.renderSearchable()
        } else {
            return this.renderList()
        }
    }
}