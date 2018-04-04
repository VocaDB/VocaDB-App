import React from 'react'
import { View, Text, ScrollView, StyleSheet, FlatList } from 'react-native'
import PropTypes from 'prop-types'
import Theme from '../../../theme'
import AlbumCard from './../AlbumCard'

class AlbumGridView extends React.Component {
    render () {

        const renderAlbumCard = album => (
            <AlbumCard key={album.id}
                       style={{ flex: 1, padding: 4 }}
                       id={album.id}
                       image={album.image}
                       name={album.name}
                       onPress={() => this.props.onPressItem(album)} />
        )

        return (
            <FlatList
                style={{ flex: 1 }}
                keyExtractor={item => item.id}
                data={this.props.albums}
                numColumns={2}
                renderItem={({ item }) => renderAlbumCard(item)} />
        )
    }
}

const styles = StyleSheet.create({
    container: {
        backgroundColor: 'white'
    },
    wrapContainer: {
        margin: 8
    },
    headerContainer: {
        margin: 8,
        flexDirection: 'row',
        justifyContent: 'space-between',
        alignItems: 'center'
    },
    contentContainer: {
        padding: 8,
        margin: 8
    }
});

AlbumGridView.propTypes = {
    title: PropTypes.string,
    albums: PropTypes.array,
    renderItem: PropTypes.func,
    onPressMore: PropTypes.func,
    onPressItem: PropTypes.func,
}

AlbumGridView.defaultProps = {
    title: 'Albums',
    albums: [],
    onPressItem: () => console.log('Press item'),
    onPressMore: () => console.log('Press more')
}

export default AlbumGridView