import React from 'react'
import { Text, TouchableOpacity, StyleSheet } from 'react-native'
import IconVector from 'react-native-vector-icons/FontAwesome';
import PropTypes from 'prop-types';

class Icon extends React.Component {

    render () {
        const size = {
            small: 16,
            medium: 24,
            large: 32,
            xlarge: 64
        }
        return (
            <TouchableOpacity style={style.container} onPress={this.props.onPress}>
                <IconVector name={this.props.name} size={size[this.props.size]} color={this.props.color} style={style.icon}  />
                {this.props.text && <Text style={[style.label, { color: this.props.color }]}>{this.props.text}</Text>}
            </TouchableOpacity>
        )
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
    onPress: PropTypes.func
}

Icon.defaultProps = {
    size: 'large',
    color: '#546E7A',
    onPress: () => console.log('No action')
}


export default Icon