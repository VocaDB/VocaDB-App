import React from 'react'
import PropTypes from 'prop-types'
import SongList from './../SongList'
import merge from "lodash/merge";

class SongWithParams extends React.Component {

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

        if(params && params.filterParams) {
            this.props.fetchSongsReplaceParams(params.filterParams)
        }
    }
    render () {
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
}

SongWithParams.propTypes = {
    params:  PropTypes.object,
    songs: PropTypes.array,
}

SongWithParams.defaultProps = {
    params: {},
    songs: [],

}

export default SongWithParams