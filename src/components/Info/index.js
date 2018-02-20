import React from 'react'
import { View, Text } from 'react-native'
import PropTypes from 'prop-types'

class Info extends React.Component {
    render () {
        return (
            <View style={{ height: 40, justifyContent: 'space-around' }}>
                <Text style={{ color: '#455A64', fontSize: 12 }}>{this.props.name}</Text>
                <Text style={{ fontSize: 16 }}>{this.props.value}</Text>
            </View>
        )
    }
}

Info.propTypes = {
    name: PropTypes.string,
    value: PropTypes.oneOfType([PropTypes.string,PropTypes.number])
}

export default Info;