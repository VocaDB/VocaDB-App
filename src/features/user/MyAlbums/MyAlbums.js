import React from 'react'
import PropTypes from 'prop-types'
import AlbumGridView from './../../album/AlbumGridView'

class MyAlbums extends React.PureComponent {

    componentDidMount() {
        this.props.onInit();
    }

    render () {
        return (<AlbumGridView albums={this.props.albums} />);
    }
}

MyAlbums.propTypes = {
    albums: PropTypes.array,
    onInit: PropTypes.func,
}

MyAlbums.defaultProps = {
    albums: [],
    onInit: () => console.log('on init')
}

export default MyAlbums;