import React from 'react'
import { View, Text, Image } from 'react-native'
import PropTypes from 'prop-types'
import Theme from './../../theme'

class Cover extends React.Component {
    render () {
        return (
            <View style={{ height: 240, backgroundColor: '#000000', justifyContent: 'center' }}>
                <Image
                    style={{flex: 1, backgroundColor: '#FFFFFF', opacity: 0.57 }}
                    source={{ uri: this.props.imageUri }}
                    resizeMode='cover'
                    blurRadius={3}
                />
                <View style={{
                    position: 'absolute',
                    backgroundColor: 'transparent',
                    flex: 1,
                    alignItems: 'center',
                    alignSelf: 'center',
                    justifyContent: 'center'
                }}>
                    <Image style={{ width: 128, height: 128 }}
                           source={{ uri: this.props.imageUri }}
                           resizeMode='contain'
                    />
                    <Text style={[Theme.titleWhite]}>{this.props.title}</Text>
                    <Text style={[Theme.subheadWhite]}>{this.props.subtitle}</Text>
                </View>
            </View>
        )
    }
}

Cover.propTypes = {
    imageUri: PropTypes.string,
    title: PropTypes.string,
    subtitle: PropTypes.string
}

export default Cover