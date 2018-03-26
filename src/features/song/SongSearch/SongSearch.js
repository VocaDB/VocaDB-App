import React from 'react'
import { View, Text, Modal, StyleSheet } from 'react-native'
import { Button, Toolbar } from 'react-native-material-ui';
import Page from '../../../components/Page/index'
import SearchBar from '../../../components/SearchBar/index'
import CenterView from '../../../components/CenterView/index'
import SongList from '../SongList/index'
import Theme from '../../../theme'

export default class SongSearch extends React.PureComponent {

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
        this.props.fetchSongs(params)
    }

    refresh() {
        this.props.fetchSongsReplaceParams()
    }

    renderList () {

        return (
            <SongList
                flatList
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

    render () {
        const queryEntry = text => this.doSearch({ query: text, start: 0 })

        return (
            <Page>
                <Toolbar
                    leftElement="arrow-back"
                    onLeftElementPress={this.props.back}
                    centerElement="Songs"
                    searchable={{
                        autoFocus: true,
                        placeholder: 'Find song',
                        onChangeText: queryEntry
                    }}
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