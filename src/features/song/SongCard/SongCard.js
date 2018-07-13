import React from 'react'
import { View, Text, TouchableOpacity, Image, Linking } from 'react-native'
import PropTypes from 'prop-types';
import Theme from '../../../theme'
import Icon from '../../../components/Icon/index'
import SongType from './../SongType'


class SongCard extends React.PureComponent {

    renderImage () {

        return (
            <View style={styles.image}>
                <Image
                    style={styles.image}
                    source={{ uri: this.props.image }}
                    resizeMode='cover'
                    resizeMethod='resize'
                />
                <View style={{  position: 'absolute', bottom: 4, right: 4 }}>
                    <SongType type={this.props.songType} />
                </View>
            </View>
        )
    }

    render () {
        return (
            <TouchableOpacity style={[styles.container]} onPress={this.props.onPress}>
                <View style={[styles.imageContainer]}>
                    {this.renderImage()}
                </View>
                <View style={[styles.infoContainer]}>
                    <Text numberOfLines={1} style={[Theme.rowTitle]}>{this.props.name}</Text>
                    <Text numberOfLines={1} style={[Theme.caption]}>{this.props.artist}</Text>
                </View>
                <View style={[styles.pvContainer]}>
                    {this.props.pvs.filter(pv => pv.pvType === 'Original').map(pv =>
                        <Icon key={pv.id} style={{ marginRight: 8 }} name={pv.service} size='medium' site onPress={() =>  Linking.openURL(pv.url).catch(err => console.error('An error occurred', err))} />)}
                </View>
            </TouchableOpacity>
        )
    }
}

const styles = {
    container: {
        width: 180,
        height: 180,
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
    },
    pvContainer: {
        flexDirection: 'row',
        alignItems: 'center',
        height: 40
    }
}

SongCard.propTypes = {
    name: PropTypes.string,
    artist: PropTypes.string,
    image: PropTypes.string,
    hideArtist: PropTypes.bool,
    pvs: PropTypes.array,
    onPress: PropTypes.func,
    songType: PropTypes.string
};

SongCard.defaultProps = {
    name: 'Unknown',
    artist: '',
    image: 'https://via.placeholder.com/350x150/000000/ffffff?text=NO_IMAGE',
    hideArtist: false,
    songType: 'Other',
    pvs: []
};

export default SongCard