import React from 'react'
import { View, Text, Button } from 'react-native'
import Song from './../Song'
import PropTypes from 'prop-types';
import style from './style'
import Theme from '../../theme'

class SongList extends React.Component {

    renderHeader () {
        return (
            <View style={style.header}>
                <View style={style.headerLeft}>
                    <Text style={Theme.headline}>{this.props.title}</Text>
                </View>
                <View style={style.headerRight}>
                </View>
            </View>
        )
    }

    render () {

        const songs = this.props.songs.slice(0, this.props.max)

        const renderItem = song => {
            const imageUrl = (song.thumbUrl) ? song.thumbUrl : undefined;
            return  (
                <Song
                    key={song.id}
                    image={imageUrl}
                    name={song.defaultName}
                    artist={song.artistString}
                    onPress={() => this.props.onPressItem(song.id)}
                />
            )
        }

        if(!songs.length) {
            return (<View></View>)
        }

        return (
            <View>
                {this.props.showHeader && this.renderHeader()}
                {songs.map(renderItem)}
            </View>
        )
    }
}

SongList.propTypes = {
    title: PropTypes.string,
    songs: PropTypes.array,
    max: PropTypes.number,
    onPressItem: PropTypes.func,
    onPressMore: PropTypes.func,
    showHeader: PropTypes.bool
};

SongList.defaultProps = {
    title: 'Song list',
    max: 10,
    showHeader: false,
    songs: [],
    onPressItem: () => {},
    onPressMore: () => {}
};

export default SongList;