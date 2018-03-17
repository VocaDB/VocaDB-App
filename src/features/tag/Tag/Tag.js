import React from 'react'
import { View, Text, TouchableOpacity } from 'react-native'
import PropTypes from 'prop-types'
import style from './style'

class Tag extends React.Component {
    render () {
        const containerStyle = [
            style.container,
            this.props.style,
            (this.props.selected)? style.selected : style.default
        ]

        return (
            <TouchableOpacity  onPress={this.props.onPress} style={containerStyle}>
                <Text style={style.text}>{'#' + this.props.name}</Text>
            </TouchableOpacity>
        )
    }
}

Tag.propTypes = {
    selected: PropTypes.bool,
    name: PropTypes.string,
    onPress: PropTypes.func
}

Tag.defaultProps = {
    selected: false,
    onPress: () => console.log('No action')
}

export default Tag;