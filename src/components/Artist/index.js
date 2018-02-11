import React from 'react'
import { Image, View, Text, TouchableOpacity, StyleSheet } from 'react-native'
import PropTypes from 'prop-types';
import images from './../../assets/images'

class Artist extends React.Component {

    renderImage () {
        return (<Image
            style={styles.image}
            resizeMode={Image.resizeMode.contain}
            source={{ uri: images.getArtistUri(this.props.id) }}
            defaultSource={images.unknownSong}
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
                        <Text style={styles.title}>{this.props.name}</Text>
                        {this.props.type && <Text>{this.props.type}</Text>}
                        {this.props.role && <Text>{this.props.role}</Text>}
                    </View>
                </View>
            </TouchableOpacity>
        )
    }
}

Artist.propTypes = {
    name: PropTypes.string,
    type: PropTypes.string,
    role: PropTypes.string
};

Artist.defaultProps = {
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
        width: 100
    },
    infoContainer: {
        flex: 1,
        justifyContent: 'center',
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


export default Artist;