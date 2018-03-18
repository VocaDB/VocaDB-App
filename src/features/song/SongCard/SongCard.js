import React from 'react'
import { View, Text, TouchableOpacity, Image } from 'react-native'
import PropTypes from 'prop-types';
import Theme from '../../../theme'

class SongCard extends React.Component {

    renderImage () {
        const uri = (this.props.image) ? this.props.image : 'http://via.placeholder.com/350x150/000000/ffffff?text=NO_IMAGE'
        return (<Image
            style={styles.image}
            source={{ uri }}
            resizeMode='cover'
        />)
    }

    render () {
        return (
            <TouchableOpacity style={[styles.container]} onPress={this.props.onPress}>
                <View style={[styles.imageContainer]}>
                    {this.renderImage()}
                </View>
                <View style={[styles.infoContainer]}>
                    <Text numberOfLines={1} style={[Theme.subhead]}>{this.props.name}</Text>
                    <Text numberOfLines={1} style={[Theme.caption]}>{this.props.artist}</Text>
                </View>
            </TouchableOpacity>
        )
    }
}

const styles = {
    container: {
        width: 160,
        height: 160,
        backgroundColor: 'white'
    },
    image: {
        flex: 1
    },
    imageContainer: {
        backgroundColor: 'black',
        height: 100
    },
    infoContainer: {
        backgroundColor: 'white',
        flex: 1,
        padding: 4
    }
}

SongCard.propTypes = {
    name: PropTypes.string,
    artist: PropTypes.string,
    image: PropTypes.string,
    hideArtist: PropTypes.bool,
    pvServices: PropTypes.array,
    onPress: PropTypes.func
};

SongCard.defaultProps = {
    name: 'Unknown',
    artist: 'Unknown',
    image: 'http://via.placeholder.com/350x150/000000/ffffff?text=NO_IMAGE',
    hideArtist: false,
    pvServices: []
};

export default SongCard