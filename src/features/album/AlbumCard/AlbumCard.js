import React from 'react'
import { View, Text, TouchableOpacity, Image } from 'react-native'
import PropTypes from 'prop-types';
import Theme from '../../../theme'
import images from '../../../common/assets/images'

class AlbumCard extends React.Component {

    renderImage () {
        return (<Image
            style={styles.image}
            source={{ uri: images.getAlbumUri(this.props.id) }}
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
                </View>
            </TouchableOpacity>
        )
    }
}

const styles = {
    container: {
        width: 160,
        height: 220,
        backgroundColor: 'white'
    },
    image: {
        flex: 1,
        borderColor: '#d6d7da',
        borderWidth: 1
    },
    imageContainer: {
        backgroundColor: 'black',
        height: 160
    },
    infoContainer: {
        backgroundColor: 'white',
        flex: 1,
        padding: 4
    }
}

AlbumCard.propTypes = {
    name: PropTypes.string,
    image: PropTypes.string,
    onPress: PropTypes.func
};

AlbumCard.defaultProps = {
    name: 'Unknown',
    image: 'http://via.placeholder.com/350x150/000000/ffffff?text=NO_IMAGE'
};

export default AlbumCard