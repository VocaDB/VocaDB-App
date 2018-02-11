import React from 'react'
import { View, Text } from 'react-native'
import PropTypes from 'prop-types'

class Tag extends React.Component {
    render () {
        return (
            <View>
                <Text>{this.props.name}</Text>
            </View>
        )
    }
}

Tag.propTypes = {
    name: PropTypes.string
}

export default Tag;