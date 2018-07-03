import React from 'react'
import { View, Text, Modal, StyleSheet } from 'react-native'
import { Button, Toolbar } from 'react-native-material-ui';
import Page from '../../../components/Page/index'
import CenterView from '../../../components/CenterView/index'
import ArtistList from '../ArtistList'
import Theme from '../../../theme'
import { ArtistRowList } from './../../artist/artistHOC'

export default class ArtistSearch extends React.Component {

    state = {
        filterVisible: false,
    };

    constructor(props) {
        super(props)
    }

    componentDidMount () {
        this.props.fetchArtists()
    }


    isSearchActive() {
        return (this.props.navigation.state
            && this.props.navigation.state.params
            && this.props.navigation.state.params.isSearchActive) ? this.props.navigation.state.params.isSearchActive : false;
    }

    renderList () {

        return (
            <ArtistRowList
                data={this.props.artists}
                onPressItem={this.props.onPressArtist}
                refreshing={this.props.loading}
                onRefresh={() => {}}
                onEndReached={() => {
                    if(!this.props.isNoResult) {
                        this.props.fetchMoreArtists()
                    }
                }} />

        )
    }

    render () {
        return (
            <Page>
                <Toolbar
                    isSearchActive={this.isSearchActive()}
                    leftElement="arrow-back"
                    onLeftElementPress={this.props.back}
                    centerElement="Artists"
                    searchable={{
                        autoFocus: true,
                        placeholder: 'Find artist',
                        onChangeText: this.props.onSearch
                    }}
                />
                <View style={styles.menuContainer}>
                    <Button raised primary icon='tune' text='Filter' style={{ container: styles.filterButton }} onPress={this.props.onPressFilter} />
                </View>
                <View style={{ flex: 1, backgroundColor: Theme.contentBackgroundColor, paddingBottom: 8 }}>
                    {this.props.artists.length > 0 && this.renderList()}
                    {this.props.artists.length === 0 && <CenterView>
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

ArtistSearch.defaultProps = {
    artists: []
}