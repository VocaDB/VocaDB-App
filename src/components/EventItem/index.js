import React from 'react'
import PropTypes from 'prop-types'
import { View, Text, Image, StyleSheet, TouchableOpacity } from 'react-native'
import images from './../../assets/images'

class EventItem extends React.Component {

    renderVertical () {
        return (
            <View style={styles.listItem}>
                <View style={styles.imageContainer}>
                    <Image
                        style={styles.image}
                        source={this.props.image}
                        defaultSource={images.unknownSong} />
                </View>

                <View style={styles.infoContainer}>
                    <Text style={styles.title}>{this.props.title}</Text>
                    <Text>{this.props.subtitle}</Text>
                    <Text>{this.props.dateTime}</Text>
                </View>
            </View>
        )
    }

    renderHorizontal () {
        return (
            <View style={hStyles.listItem}>
                <View style={hStyles.imageContainer}>
                    <Image
                        resizeMode='contain'
                        style={hStyles.image}
                        source={this.props.image}
                        defaultSource={images.unknownSong} />
                </View>

                <View style={hStyles.infoContainer}>
                    <Text style={hStyles.title} numberOfLines={1}>{this.props.title}</Text>
                    <Text  numberOfLines={2}>{this.props.subtitle}</Text>
                    <Text>{this.props.dateTime}</Text>
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
        width: 200
    },
    imageContainer: {
        padding: 4
    },
    infoContainer: {
        flex: 1,
        padding: 4
    },
    image: {
        width: 180,
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

EventItem.propTypes = {
    title: PropTypes.string.isRequired,
    subtitle: PropTypes.string,
    dateTime: PropTypes.string,
    onMediaClick: PropTypes.func.isRequired,
    horizontal: PropTypes.bool
}

EventItem.defaultProps = {
    image: ''
};

export default EventItem;