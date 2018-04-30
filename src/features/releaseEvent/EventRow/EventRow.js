import React from 'react'
import { Image, View, Text, TouchableOpacity, StyleSheet } from 'react-native'
import PropTypes from 'prop-types';
import images from '../../../common/assets/images'
import Theme from '../../../theme'
import moment from 'moment'

class EventRow extends React.Component {
    render () {
        return (
            <TouchableOpacity onPress={this.props.onPress} style={[{ height: 180, backgroundColor: 'black', justifyContent: 'flex-end', margin: 8 }]}>
                <Image style={{ flex: 1, opacity: 0.57 }}
                       source={{ uri: this.props.thumbnail }}
                       resizeMethod='resize'
                >

                </Image>
                <View style={{ backgroundColor:'transparent', position: 'absolute', padding: 8 }}>
                    <Text style={{ color: 'white' }}>{moment(this.props.date).format('dddd, MMMM Do YYYY')}</Text>
                    <Text style={Theme.headlineWhite}>{this.props.name}</Text>
                    <Text style={Theme.headlineWhite}>{this.props.location}</Text>
                </View>
            </TouchableOpacity>
        )
    }
}

EventRow.propTypes = {
    name: PropTypes.string,
    thumbnail: PropTypes.string,
    location: PropTypes.string,
    date: PropTypes.string
};

EventRow.defaultProps = {
    thumbnail: 'https://via.placeholder.com/350x150/000000/ffffff?text=EVENT'
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


export default EventRow;