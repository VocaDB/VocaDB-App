import React from 'react'
import { View, Text, TouchableOpacity } from 'react-native'
import PropTypes from 'prop-types'
import Theme from './../../theme'
import Icon from './../../components/Icon'

class Track extends React.Component {
    render () {
        return (

            // <Text style={[Theme.caption, { marginRight: 4 }]} key={pvService}>{pvService}</Text>
            <TouchableOpacity  onPress={this.props.onPress} style={
                [{ backgroundColor: '#ffffff', padding: 8, flexDirection: 'row', justifyContent: 'space-between', height: 72 },
                    this.props.style]}>
                <View style={{ justifyContent: 'space-around' }}>
                    <Text style={Theme.body}>{this.props.name}</Text>
                    {this.props.artist.length > 0 && <Text style={Theme.caption}>{this.props.artist}</Text>}
                    {this.props.pvServices.length > 0 && (
                        <View style={{ flexDirection: 'row', alignItems: 'center' }}>
                            {this.props.pvServices.map(pvService =>
                                <Icon style={{ marginRight: 4 }} key={pvService} name={pvService} size='small' site />)}
                        </View>
                    )}
                </View>
                <View style={{ justifyContent: 'center' }}>
                    <Icon name='md-more' />
                </View>
            </TouchableOpacity>
        )
    }
}

Track.propTypes = {
    name: PropTypes.string,
    artist: PropTypes.string,
    pvServices: PropTypes.array,
    onPress: PropTypes.func
}

Track.defaultProps = {
    pvServices: [],
    onPress: () => console.log('No action')
}

export default Track;