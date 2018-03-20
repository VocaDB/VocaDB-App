import React from 'react'
import { View, Text, Modal, StyleSheet } from 'react-native'
import { Button } from 'react-native-material-ui';
import Page from '../../../components/Page/index'
import SearchBar from '../../../components/SearchBar/index'
import CenterView from '../../../components/CenterView/index'
import SongList from '../SongList/index'
import Theme from '../../../theme'
import merge from "lodash/merge";

export default class SongSearch extends React.Component {

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

        const queryEntry = text => this.doSearch({ query: text, start: 0 })
        
        return (
            <Page>
                <SearchBar
                    onLeftElementPress={this.props.back}
                    onChangeText={queryEntry}
                />

                <View style={styles.menuContainer}>
                    <Button raised primary icon='tune' text='Filter' style={{ container: styles.filterButton }} onPress={this.props.onPressFilter} />
                </View>
                <View style={styles.resultContainer}>
                    {this.props.songs.length > 0 && this.renderList()}
                    {this.props.songs.length === 0 && <CenterView>
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

const styles = StyleSheet.create({
    menuContainer: {
        alignItems: 'center',
        backgroundColor: 'white'
    },
    filterButton: {
        margin: 8,
        width: 128
    },
    resultContainer: {
        flex: 1,
        backgroundColor: Theme.contentBackgroundColor,
        paddingBottom: 8
    }
})

SongSearch.defaultProps = {
    songs: []
}