import React from 'react'
import { Image, View, Text, TouchableOpacity, StyleSheet } from 'react-native'
import PropTypes from 'prop-types';
import Theme from '../../theme'
import moment from 'moment'

class Song extends React.Component {

    renderImage () {
        return (<Image
            style={styles.image}
            source={{ uri: this.props.image }}
        />)
    }

    render () {
        return (
            <TouchableOpacity onPress={this.props.onPress}>
                <View style={styles.listItem}>
                    <View style={styles.imageContainer}>
                        {this.renderImage()}
                    </View>

                    <View style={styles.infoContainer}>
                        <Text style={Theme.subhead}>{this.props.name}</Text>
                        <Text style={Theme.caption} numberOfLines={2}>{this.props.artist}</Text>
                        <Text style={Theme.caption}>{this.props.dateTime}</Text>
                        <Text style={Theme.caption}>{moment(this.props.dateTime).fromNow()}</Text>
                    </View>
                </View>
            </TouchableOpacity>
        )
    }
}

Song.propTypes = {
    name: PropTypes.string,
    artist: PropTypes.string,
    hideArtist: PropTypes.bool,
    onPress: PropTypes.func
};

Song.defaultProps = {
    name: 'Title',
    artist: 'hatsune misku',
    hideArtist: false
};

const styles =  StyleSheet.create({
    listItem: {
        flexDirection: 'row',
        backgroundColor: 'white',
        padding: 4,
        height: 100
    },
    imageContainer: {
        padding: 4,
        // backgroundColor: '#546E7A',
        width: 160
    },
    infoContainer: {
        flex: 1,
        padding: 4
    },
    image: {
        flex: 1
    },
    title: {
        fontSize: 16,
        fontWeight: 'bold',
        marginBottom: 4
    },
    subtitle: {

    }
})


export default Song;