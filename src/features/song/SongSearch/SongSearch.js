import React from 'react'
import { View, Text } from 'react-native'
import { Button } from 'react-native-material-ui';
import Page from '../../../components/Page/index'
import SearchBar from '../../../components/SearchBar/index'
import CenterView from '../../../components/CenterView/index'
import SongList from '../SongList/index'
import Theme from '../../../theme'
import merge from "lodash/merge";

export default class SongSearch extends React.Component {

    constructor(props) {
        super(props)
    }

    componentDidMount () {
        this.refresh()
    }

    doSearch(params) {
        this.props.fetchSongs(merge({}, this.props.params, params))
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
                    {this.props.songs.length > 0 && this.renderList()}
                    {this.props.songs.length === 0 && <CenterView>
                        <Text>No result</Text>
                    </CenterView>}
                    <View style={{ justifyContent: 'center', alignItems: 'center' }}>
                        <Button raised primary icon='tune' text='Filter' style={{
                            container: {
                                width: 128
                            }
                        }} />
                    </View>
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

SongSearch.defaultProps = {
    songs: []
}