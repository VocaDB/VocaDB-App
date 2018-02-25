import React from 'react'
import { Text, TouchableOpacity, StyleSheet, View, Image } from 'react-native'
import IconVector from 'react-native-vector-icons/Ionicons';
import PropTypes from 'prop-types';
import IconSites from './../../assets/iconSites'

class Icon extends React.Component {

    render () {
        const size = {
            small: 16,
            medium: 24,
            large: 32,
            xlarge: 64
        }

        const renderIcon = () => {

            if(this.props.site) {

                if(IconSites.find(this.props.name)) {
                    const iconSiteSource = IconSites.find(this.props.name)
                    return <Image style={{ width: 32, height: 32, alignSelf: 'center' }} resizeMode='cover' source={iconSiteSource} />
                } else {
                    return <IconVector name='ios-globe' size={size[this.props.size]} color={this.props.color} style={style.icon}  />
                }

            }

            return <IconVector name={this.props.name} size={size[this.props.size]} color={this.props.color} style={style.icon}  />

        }

        if(this.props.pureIcon) {
            return renderIcon()
        } else {
            return (
                <TouchableOpacity style={style.container} onPress={this.props.onPress}>
                    <View>
                        {renderIcon()}
                        {this.props.text && <Text style={[style.label, { color: this.props.color }]}>{this.props.text}</Text>}
                    </View>
                </TouchableOpacity>
            )
        }

    }
}

const style = StyleSheet.create({
    container: {
        flex: 1,
        alignItems: 'center',
        justifyContent: 'center'
    },
    icon: {
        textAlign: 'center',
        margin: 8
    },
    label: {
        fontSize: 12
    }
})

Icon.propTypes = {
    name: PropTypes.string,
    text: PropTypes.string,
    size: PropTypes.oneOf(['small', 'medium', 'large', 'xlarge']),
    color: PropTypes.string,
    onPress: PropTypes.func,
    pureIcon: PropTypes.bool,
    site: PropTypes.bool
}

Icon.defaultProps = {
    site: false,
    pureIcon: false,
    size: 'large',
    color: '#546E7A',
    onPress: () => console.log('No action')
}


export default Icon