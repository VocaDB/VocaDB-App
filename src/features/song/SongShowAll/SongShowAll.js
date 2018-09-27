import React from 'react';
import PropTypes from 'prop-types';
import SongList from './../SongList';

class SongShowAll extends React.Component {

    render () {
        return (
            <SongList
                flatList
                showHeader={false}
                songs={this.props.songs}
                onPressItem={this.props.onPressSong}
                hideMoreButton={true} />
        )
    }
}

SongShowAll.propTypes = {
    songs: PropTypes.array,
    onPressSong: PropTypes.func
}

SongShowAll.defaultProps = {
    songs: [],
    onPressSong: () => console.log('press song')
}

export default SongShowAll