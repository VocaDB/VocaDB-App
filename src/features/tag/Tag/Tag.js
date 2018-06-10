import React from 'react'
import { View, Text, TouchableOpacity } from 'react-native'
import PropTypes from 'prop-types'
import style from './style'
import IconVector from 'react-native-vector-icons/Ionicons';

class Tag extends React.Component {
    render () {
        const containerStyle = [
            style.container,
            this.props.style,
            (this.props.selected)? style.selected : style.default
        ]


        const IconRemove = () => (

            <TouchableOpacity style={{ alignItems: 'center', justifyContent: 'center', alignSelf: 'center', marginLeft: 8 }} onPress={this.props.onRemovePress}>
                <IconVector name='ios-close' size={24} color='white' style={{  alignItems: 'center', justifyContent: 'center', alignSelf: 'center' }}  />
            </TouchableOpacity>
        )

        return (

            <TouchableOpacity  onPress={this.props.onPress} style={containerStyle}>
                <Text style={style.text}>{'#' + this.props.name}</Text>
                {this.props.showRemoveButton && <IconRemove />}
            </TouchableOpacity>
        )
    }
}

Tag.propTypes = {
    selected: PropTypes.bool,
    name: PropTypes.string,
    onPress: PropTypes.func,
    onRemovePress: PropTypes.func,
    showRemoveButton: PropTypes.bool
}

Tag.defaultProps = {
    selected: false,
    showRemoveButton: false,
    onPress: () => console.log('No action'),
    onRemovePress: () => console.log('No action')
}

export default Tag;