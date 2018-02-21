import React from 'react'
import { RefreshControl, ScrollView } from 'react-native'
import SongList from './../../components/SongList'

export default class SongListPage extends React.Component {

    componentDidMount () {
        this.refresh()
    }

    refresh() {
        const requestParams = this.getNavigationParams()
        this.props.fetchSongs({ ...requestParams })
    }

    getNavigationParams () {
        const {params} = this.props.navigation.state;
        return (params) ? params.params : {
            'maxResults': 50,
            'fields': 'thumbUrl'
        }
    }

    render () {
        return (
            <SongList
                flatList
                title='Recent songs'
                showHeader={false}
                songs={this.props.songs}
                onPressItem={this.props.onPressSong}
                refreshing={this.props.refreshing}
                onRefresh={this.refresh.bind(this)}
                onEndReached={() => {
                    const requestParams = this.getNavigationParams()
                    this.props.fetchSongs({ ...requestParams, start: this.props.songs.length })
                }}
                hideMoreButton={true} />

        )
    }
}