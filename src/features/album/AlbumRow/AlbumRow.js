import React from 'react'
import { Image, View, Text, TouchableOpacity, StyleSheet } from 'react-native'
import PropTypes from 'prop-types';
import images from '../../../common/assets/images'
import style from './style'
import Theme from '../../../theme'
import FastImage from 'react-native-fast-image'

class AlbumRow extends React.PureComponent {

    componentWillMount () {
        this.styleSelected = style[this.props.display]
    }

    renderImage () {

        return (
            <FastImage
                style={[this.styleSelected.image, { borderColor: '#d6d7da', borderWidth: 1 }]}
                source={{
                    uri:this.props.image,
                    priority: FastImage.priority.normal,
                }}
                resizeMode={FastImage.resizeMode.cover}
                resizeMethod='resize'
            />
        )
    }

    render () {
        return (
            <TouchableOpacity onPress={this.props.onPress}>
                <View style={this.styleSelected.listItem}>
                    <View style={this.styleSelected.imageContainer}>
                        {this.renderImage()}
                    </View>

                    <View style={this.styleSelected.infoContainer}>
                        <Text style={Theme.rowTitle}>{this.props.name}</Text>
                    </View>
                </View>
            </TouchableOpacity>
        )
    }
}

AlbumRow.propTypes = {
    id: PropTypes.number,
    name: PropTypes.string,
    display: PropTypes.oneOf(['row', 'box']),
    image: PropTypes.string,
    onPress: PropTypes.func
};

AlbumRow.defaultProps = {
    display: 'row',
    onPress: () => console.log('press album')
};


export default AlbumRow;