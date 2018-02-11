import React from 'react'
import { Image, View, Text, TouchableOpacity, StyleSheet } from 'react-native'
import PropTypes from 'prop-types';
import images from './../../assets/images'
import style from './style'

class Album extends React.Component {

    componentWillMount () {
        this.styleSelected = style[this.props.display]
    }

    renderImage () {
        return (<Image
            style={this.styleSelected.image}
            source={{ uri: this.props.image }}
            defaultSource={images.unknownSong}
        />)
    }

    render () {
        return (
            <TouchableOpacity onPress={this.props.onPress}>
                <View style={this.styleSelected.listItem}>
                    <View style={this.styleSelected.imageContainer}>
                        {this.renderImage()}
                    </View>

                    <View style={this.styleSelected.infoContainer}>
                        <Text style={this.styleSelected.title}>{this.props.name}</Text>
                    </View>
                </View>
            </TouchableOpacity>
        )
    }
}

Album.propTypes = {
    name: PropTypes.string,
    display: PropTypes.oneOf(['row', 'box'])
};

Album.defaultProps = {
    display: 'row'
};


export default Album;