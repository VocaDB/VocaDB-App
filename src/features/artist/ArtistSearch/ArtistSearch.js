import React from 'react'
import { View, Text, Modal } from 'react-native'
import { Button } from 'react-native-material-ui';
import Page from '../../../components/Page/index'
import SearchBar from '../../../components/SearchBar/index'
import CenterView from '../../../components/CenterView/index'
import ArtistList from '../ArtistList'
import Theme from '../../../theme'
import merge from "lodash/merge"

export default class ArtistSearch extends React.Component {

    state = {
        filterVisible: false,
    };

    constructor(props) {
        super(props)
    }

    componentDidMount () {
        this.refresh()
    }

    doSearch(params) {
        this.props.fetchArtists(merge({}, this.props.params, params))
    }

    navParams() {
        const navigation = this.props.navigation
        return (navigation && navigation.state && navigation.state.params)? navigation.state.params : {}
    }

    refresh() {
        const params = this.navParams()

        if(params && params.params) {
            this.doSearch(params.params)
        }
    }

    renderList () {

        return (
            <ArtistList
                artists={this.props.artists}
                onPressItem={this.props.onPressArtist}
                refreshing={this.props.loading}
                onRefresh={this.refresh.bind(this)}
                onEndReached={() => {
                    if(!this.props.isNoResult) {
                        this.doSearch({ start: this.props.artists.length })
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
                    {this.props.artists.length > 0 && this.renderList()}
                    {this.props.artists.length === 0 && <CenterView>
                        <Text>No result</Text>
                    </CenterView>}
                </View>
            </Page>
        )
    }

    render () {

        const params = this.navParams()

        if(this.props.searchable || params.searchable) {
            return this.renderSearchable()
        } else {
            return this.renderList()
        }
    }
}

ArtistSearch.defaultProps = {
    artists: []
}