import React from 'react'
import { View, Text, TouchableOpacity } from 'react-native'
import PropTypes from 'prop-types'
import Theme from './../../theme'
import Icon from './../../components/Icon'

class Track extends React.Component {
    render () {
        return (
            <TouchableOpacity  onPress={this.props.onPress} style={
                [{ backgroundColor: '#ffffff', padding: 8, flexDirection: 'row', justifyContent: 'space-between', height: 64 },
                    this.props.style]}>
                <View style={{ justifyContent: 'space-around' }}>
                    <Text style={Theme.body}>{this.props.name}</Text>
                    {this.props.artist && <Text style={Theme.caption}>{this.props.artist}</Text>}
                </View>
                <View style={{ justifyContent: 'center' }}>
                    <Text style={Theme.body}></Text>
                    <Text style={Theme.caption}></Text>
                </View>
            </TouchableOpacity>
        )
    }
}

Track.propTypes = {
    name: PropTypes.string,
    artist: PropTypes.string,
    onPress: PropTypes.func
}

Track.defaultProps = {
    onPress: () => console.log('No action')
}

export default Track;