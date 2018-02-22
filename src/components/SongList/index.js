import React from 'react'
import { View, Text, Button, FlatList } from 'react-native'
import Song from './../Song'
import PropTypes from 'prop-types';
import style from './style'
import Theme from '../../theme'

class SongList extends React.Component {

    renderHeader () {
        return (
            <View style={style.header}>
                <View style={style.headerLeft}>
                    <Text style={Theme.subhead}>{this.props.title}</Text>
                </View>
                <View style={style.headerRight}>
                </View>
            </View>
        )
    }

    render () {
        const renderItem = song => {
            const imageUrl = (song.thumbUrl) ? song.thumbUrl : 'http://via.placeholder.com/350x150/000000/ffffff?text=NO_IMAGE';
            return  (
                <Song
                    key={song.id}
                    image={imageUrl}
                    name={song.defaultName}
                    artist={song.artistString}
                    onPress={() => this.props.onPressItem(song)}
                />
            )
        }

        if(!this.props.songs.length) {
            return (<View></View>)
        }

        if(this.props.flatList) {
            return (
                <FlatList
                    removeClippedSubviews
                    disableVirtualization
                    data={this.props.songs}
                    keyExtractor={(item) => item.id}
                    renderItem={({item}) => renderItem(item)}
                    refreshing={this.props.refreshing}
                    onRefresh={this.props.onRefresh}
                    onEndReached={this.props.onEndReached}
                    onEndReachedThreshold={0.3}
                />
            )
        } else {

            let songs = this.props.songs.slice(0, this.props.max)

            return (
                <View>
                    {this.props.showHeader && this.renderHeader()}
                    {songs.map(renderItem)}
                    {this.props.footer}
                </View>
            )
        }

    }
}

SongList.propTypes = {
    title: PropTypes.string,
    songs: PropTypes.array,
    max: PropTypes.number,
    onPressItem: PropTypes.func,
    onPressMore: PropTypes.func,
    showHeader: PropTypes.bool,
    footer: PropTypes.element,
    flatList: PropTypes.bool,
    refreshing: PropTypes.bool,
    onRefresh: PropTypes.func,
    onEndReached: PropTypes.func
};

SongList.defaultProps = {
    title: 'Song list',
    max: 10,
    showHeader: false,
    songs: [],
    flatList: false,
    onPressItem: () => {}
};

export default SongList;