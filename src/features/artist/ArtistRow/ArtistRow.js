import React from 'react'
import { Image, View, Text, TouchableOpacity, StyleSheet } from 'react-native'
import { Avatar } from 'react-native-elements'
import PropTypes from 'prop-types';
import images from '../../../common/assets/images'
import Theme from '../../../theme'
import Icon from './../../../components/Icon'

class Artist extends React.Component {
    renderImage () {
        return (
            <Avatar
                medium
                rounded
                source={{uri: images.getArtistUri(this.props.id)}}
                onPress={() => console.log("Works!")}
                activeOpacity={0.7}
            />
        )
    }

    renderRightIcon () {
        return this.props.rightIcon ? (
            <View style={styles.rightContainer}>
                <Icon name={this.props.rightIcon} />
            </View>
        ) : null
    }

    render () {

        if(this.props.display == 'avatar') {
            return (
                <View style={{ margin: 4 }}>
                    <Avatar
                        large
                        rounded
                        source={{uri: images.getArtistUri(this.props.id)}}
                        onPress={this.props.onPress}
                        activeOpacity={0.7}
                    />
                </View>
            )
        }

        return (
            <TouchableOpacity onPress={this.props.onPress}>
                <View style={styles.listItem}>
                    <View style={styles.imageContainer}>
                        {this.renderImage()}
                    </View>

                    <View style={styles.infoContainer}>
                        <Text style={[Theme.rowTitle, { marginBottom: 4 }]}>{this.props.name}</Text>
                        {this.props.type && <Text style={Theme.caption}>{this.props.type}</Text>}
                        {this.props.role && <Text style={Theme.caption}>{this.props.role}</Text>}
                    </View>

                    {this.renderRightIcon()}
                </View>
            </TouchableOpacity>
        )
    }
}

Artist.propTypes = {
    name: PropTypes.string,
    type: PropTypes.string,
    role: PropTypes.string,
    rightIcon: PropTypes.string,
    onRightElementPress: PropTypes.func,
    horizontal: PropTypes.bool,
    display: PropTypes.oneOf(['row', 'avatar'])
};

Artist.defaultProps = {
    horizontal: false,
    display: 'row',
    onRightElementPress: () => console.log('Press right')
};

const styles =  StyleSheet.create({
    listItem: {
        flexDirection: 'row',
        backgroundColor: 'white',
        padding: 4,
        height: 72
    },
    imageContainer: {
        padding: 4,
        alignItems: 'center',
        justifyContent: 'center',
        width: 100
    },
    infoContainer: {
        flex: 1,
        justifyContent: 'center',
        padding: 4
    },
    rightContainer: {
        width: 72,
        alignItems: 'center',
        justifyContent: 'center'
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