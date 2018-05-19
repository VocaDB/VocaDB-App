import React from 'react'
import { View, Text, ScrollView, StyleSheet, FlatList } from 'react-native'
import PropTypes from 'prop-types'
import Theme from '../../../theme'
import { Button } from 'react-native-material-ui';
import FeatureList from './../../main/FeatureList'
import SongCard from './../SongCard'

class SongHorizontalList extends React.PureComponent {
    render () {

        const renderSongCard = song => (
            <SongCard key={song.id}
                      id={song.id}
                      name={song.name}
                      artist={song.artistString}
                      image={song.image}
                      pvs={song.pvs}
                      songType={song.songType}
                      onPress={() => this.props.onPressItem(song)} />
        )

        return (
            <FeatureList
                title={this.props.title}
                items={this.props.songs}
                displayMoreButton={false}
                renderItem={renderSongCard} />
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

SongHorizontalList.propTypes = {
    title: PropTypes.string,
    songs: PropTypes.array,
    renderItem: PropTypes.func,
    onPressMore: PropTypes.func,
    onPressItem: PropTypes.func,
}

SongHorizontalList.defaultProps = {
    title: 'Songs',
    songs: [],
    onPressItem: () => console.log('Press item'),
    onPressMore: () => console.log('Press more')
}

export default SongHorizontalList