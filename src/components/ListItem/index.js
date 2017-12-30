import React from 'react'
import PropTypes from 'prop-types'
import { View, Text, Image, StyleSheet, TouchableOpacity } from 'react-native'

class ListItem extends React.Component {
    
    render () {
        return (
            <TouchableOpacity onPress={this.props.onItemClick}>
                <View style={styles.listItem}>
                    <View style={styles.imageContainer}>
                        <Image
                            style={styles.image}
                            source={{ uri: this.props.image }} />
                    </View>

                    <View style={styles.infoContainer}>
                        <Text style={styles.title}>{this.props.title}</Text>
                        <Text style={styles.subtitle}>{this.props.subtitle}</Text>
                    </View>
                </View>
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
        padding: 4,
        justifyContent: 'center'
    },
    image: {
        width: 64,
        height: 64
    },
    title: {
        fontSize: 16,
        fontWeight: 'bold',
        marginBottom: 4
    },
    subtitle: {

    }
})

ListItem.propTypes = {
    image: PropTypes.string,
    title: PropTypes.string.isRequired,
    subtitle: PropTypes.string,
    dateTime: PropTypes.string,
    onItemClick: PropTypes.func.isRequired,
    horizontal: PropTypes.bool
}

ListItem.defaultProps = {
    image: 'http://tn.smilevideo.jp/smile?i=30237236'
};

export default ListItem;