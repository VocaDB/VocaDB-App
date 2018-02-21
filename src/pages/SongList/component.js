import React from 'react'
import { RefreshControl, ScrollView } from 'react-native'
import SongList from './../../components/SongList'

export default class SongListPage extends React.Component {

    componentDidMount () {
        this.refresh()
    }

    refresh() {
        const { params } = this.props.navigation.state;
        const requestParams = (params)? params.params : {}
        this.props.fetchSongs({ ...requestParams })
    }

    render () {
        return (
            <ScrollView refreshControl={
                <RefreshControl
                    refreshing={this.props.refreshing}
                    onRefresh={this.refresh.bind(this)}
                />}>
                <SongList max={30} title='Recent songs' showHeader={false} songs={this.props.songs} onPressItem={this.props.onPressSong} hideMoreButton={true} />
             </ScrollView>
        )
    }
}