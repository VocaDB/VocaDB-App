import React from 'react'
import { TouchableOpacity } from 'react-native'
import Icon from 'react-native-vector-icons/Ionicons';

const IconButton = (props) => (
    <TouchableOpacity onPress={props.onPress}><Icon name={props.name} color={props.color} size={props.size} /></TouchableOpacity>
)

IconButton.defaultProps = {
    name: '',
    color: 'white',
    size: 30,
    onPress: () => console.log('Press')
}

export default IconButton;