import React from 'react'
import { Image, View, Text, TouchableOpacity, StyleSheet } from 'react-native'
import PropTypes from 'prop-types';
import images from '../../../common/assets/images'
import Theme from '../../../theme'
import moment from 'moment'

class EventCard extends React.Component {
    render () {
        return (
            <TouchableOpacity onPress={this.props.onPress} style={[styles.container]}>
                <Image style={[styles.coverImage]} source={{ uri: this.props.thumbnail }}
                       resizeMethod='resize'
                />
                <View style={[styles.infoContainer]}>
                    <Text style={Theme.subheadWhite}>{moment(this.props.date).format('dddd, MMMM Do YYYY')}</Text>
                    <Text numberOfLines={2} style={Theme.subheadWhite}>{this.props.name}</Text>
                    <Text numberOfLines={1} style={Theme.subheadWhite}>{this.props.location}</Text>
                </View>
            </TouchableOpacity>
        )
    }
}

EventCard.propTypes = {
    name: PropTypes.string,
    image: PropTypes.string,
    location: PropTypes.string,
    date: PropTypes.string
};

EventCard.defaultProps = {
    thumbnail: 'https://via.placeholder.com/350x150/000000/ffffff?text=EVENT'
};

const styles =  StyleSheet.create({
    container: {
        width: 320,
        height: 180,
        backgroundColor: 'black',
        justifyContent: 'flex-end',
        margin: 8
    },
    coverImage: {
        flex: 1,
        opacity: 0.57
    },
    infoContainer: {
        backgroundColor:'transparent',
        position: 'absolute',
        padding: 8
    }
})


export default EventCard;