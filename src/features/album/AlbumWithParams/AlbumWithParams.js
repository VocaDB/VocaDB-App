import React from 'react'
import PropTypes from 'prop-types'
import { FlatList } from 'react-native'
import AlbumRow from '../../album/AlbumRow'

class AlbumWithParams extends React.Component {

    componentDidMount () {
        this.props.fetchAlbums(this.props.navigation.state.key, this.props.navigation.state.params.filterParams)
    }

    render () {

        const renderAlbumRow = album => {
            return  (
                <AlbumRow
                    key={album.id}
                    image={album.image}
                    name={album.name}
                    artist={album.artistString}
                    onPress={() => this.props.onPressAlbum(album)}
                />
            )
        }

        return (
            <FlatList
                data={this.props.albums}
                keyExtractor={item => item.id}
                refreshing={this.props.loading}
                onEndReached={() => {
                        this.props.fetchMoreAlbums(this.props.navigation.state.key)
                }}
                renderItem={({ item }) => renderAlbumRow(item)} />
        )
    }
}

AlbumWithParams.propTypes = {
    params:  PropTypes.object,
    albums: PropTypes.array,
}

AlbumWithParams.defaultProps = {
    params: {},
    albums: [],

}

export default AlbumWithParams