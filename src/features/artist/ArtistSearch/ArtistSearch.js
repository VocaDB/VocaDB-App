import React from 'react'
import { View, Text, Modal } from 'react-native'
import { Button, Toolbar } from 'react-native-material-ui';
import Page from '../../../components/Page/index'
import CenterView from '../../../components/CenterView/index'
import ArtistList from '../ArtistList'
import Theme from '../../../theme'

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
        this.props.fetchArtists(params)
    }

    refresh() {
        this.doSearch()
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

    render () {
        return (
            <Page>
                <Toolbar
                    leftElement="arrow-back"
                    onLeftElementPress={this.props.back}
                    centerElement="Artists"
                    searchable={{
                        autoFocus: true,
                        placeholder: 'Find artist',
                        onChangeText: text => {
                            this.doSearch({ query: text, start: 0 })
                        }
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
}

ArtistSearch.defaultProps = {
    artists: []
}