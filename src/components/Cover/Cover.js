import React from 'react'
import { View, Text, Image } from 'react-native'
import PropTypes from 'prop-types'
import Theme from './../../theme'
import FastImage from 'react-native-fast-image'



class Cover extends React.PureComponent {

    render () {
        return (
            <View style={{ height: 240, backgroundColor: '#000000', justifyContent: 'center' }}>

                <Image
                    style={{flex: 1, backgroundColor: '#FFFFFF', opacity: 0.57 }}
                    source={{ uri: this.props.imageUri }}
                    resizeMode='cover'
                    resizeMethod='resize'
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
                    <FastImage
                        style={{
                            width: 128,
                            height: 128 }}
                        source={{
                            uri:this.props.imageUri,
                            priority: FastImage.priority.normal,
                        }}
                        resizeMode={FastImage.resizeMode.contain}
                        resizeMethod='resize'
                    />
                    <Text style={[Theme.titleWhite, { paddingHorizontal: 8, textAlign: 'center' }]}>{this.props.title}</Text>
                    <Text style={[Theme.subheadWhite, { paddingHorizontal: 8, textAlign: 'center' }]} textAlign='center'>{this.props.subtitle}</Text>
                    <Text style={[Theme.subheadWhite, { paddingHorizontal: 8, textAlign: 'center' }]} textAlign='center'>{this.props.subtitle2}</Text>
                </View>
            </View>
        )
    }
}

Cover.propTypes = {
    imageUri: PropTypes.string,
    title: PropTypes.string,
    subtitle: PropTypes.string,
    subtitle2: PropTypes.string
}

Cover.defaultProps = {
    subtitle2: ''
}

export default Cover