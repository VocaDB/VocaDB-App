import React from 'react'
import PropTypes from 'prop-types'
import SongList from './../SongList'

class SongWithParams extends React.Component {

    componentDidMount () {
        this.props.fetchSongs(this.props.navigation.state.key, this.props.navigation.state.params.filterParams)
    }

    render () {
        return (
            <SongList
                flatList
                showHeader={false}
                songs={this.props.songs}
                onPressItem={this.props.onPressSong}
                refreshing={this.props.loading}
                onEndReached={() => {
                    this.props.fetchMoreSongs(this.props.navigation.state.key)
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