import React from 'react'
import { View, Text, TouchableOpacity } from 'react-native'
import PropTypes from 'prop-types'

class Tag extends React.Component {
    render () {
        return (
            <TouchableOpacity  onPress={this.props.onPress} style={
                [{ backgroundColor: '#3949AB', padding: 8, flexDirection: 'row', justifyContent: 'space-between' },
                this.props.style]}>
                <Text style={{ color: 'white', fontWeight: 'bold' }}>{'#' + this.props.name}</Text>
            </TouchableOpacity>
        )
    }
}

Tag.propTypes = {
    name: PropTypes.string,
    onPress: PropTypes.func
}

Tag.defaultProps = {
    onPress: () => console.log('No action')
}

export default Tag;