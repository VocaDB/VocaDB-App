import React from 'react'
import { TouchableOpacity, Text, Linking } from 'react-native'
import PropTypes from 'prop-types'

class WebLink extends React.Component {
    render () {
        return (
            <TouchableOpacity onPress={() => Linking.openURL(this.props.url).catch(err => console.error('An error occurred', err))} style={{ margin: 4 }}>
                <Text>{this.props.name}</Text>
            </TouchableOpacity>
        )
    }
}

WebLink.propTypes = {
    name: PropTypes.string,
    url: PropTypes.string
}

export default WebLink