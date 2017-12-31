import React from 'react'
import PropTypes from 'prop-types'
import { View, Image, StyleSheet, TouchableOpacity } from 'react-native'
import { Grid, Row, Col, Text, Container, Content } from 'native-base'
import images from './../../assets/images'

class MediaItem extends React.Component {

    renderVertical () {
        return (
                <View style={styles.listItem}>
                    <View style={styles.imageContainer}>
                        <Image
                            style={styles.image}
                            source={{ uri: this.props.image }}
                            defaultSource={images.unknownSong}
                            />
                    </View>

                    <View style={styles.infoContainer}>
                        <Text style={styles.title}>{this.props.title}</Text>
                        <Text note>{this.props.subtitle}</Text>
                        <Text note>{this.props.dateTime}</Text>
                    </View>
                </View>
        )
    }

    renderHorizontal () {
        return (
                <View style={hStyles.listItem}>
                    <View style={hStyles.imageContainer}>
                        <Image
                            style={hStyles.image}
                            source={{ uri: this.props.image }} />
                    </View>

                    <View style={hStyles.infoContainer}>
                        <Text style={hStyles.title} numberOfLines={1}>{this.props.title}</Text>
                        <Text note numberOfLines={2}>{this.props.subtitle}</Text>
                        <Text note>{this.props.dateTime}</Text>
                    </View>
                </View>
        )
    }

    render () {

        const vItem = this.renderVertical()
        const hItem = this.renderHorizontal()
        return (
            <TouchableOpacity onPress={this.props.onMediaClick}>
                {this.props.horizontal ? hItem : vItem}
            </TouchableOpacity>
        )
    }
}

const styles = StyleSheet.create({
    listItem: {
        flexDirection: 'row',
        backgroundColor: 'white',
        padding: 4
    },
    imageContainer: {
        padding: 4
    },
    infoContainer: {
        flex: 1,
        padding: 4
    },
    image: {
        width: 150,
        height: 100
    },
    title: {
        fontSize: 16,
        fontWeight: 'bold',
        marginBottom: 4
    },
    subtitle: {

    }
})

const hStyles = StyleSheet.create({
    listItem: {
        flexDirection: 'column',
        backgroundColor: 'white',
        padding: 4,
        width: 160
    },
    imageContainer: {
        padding: 4
    },
    infoContainer: {
        flex: 1,
        padding: 4
    },
    image: {
        width: 150,
        height: 150
    },
    title: {
        fontSize: 16,
        fontWeight: 'bold',
        marginBottom: 4
    },
    subtitle: {

    }
})

MediaItem.propTypes = {
    image: PropTypes.string,
    title: PropTypes.string.isRequired,
    subtitle: PropTypes.string,
    dateTime: PropTypes.string,
    onMediaClick: PropTypes.func.isRequired,
    horizontal: PropTypes.bool
}

MediaItem.defaultProps = {
    image: ''
};

export default MediaItem;