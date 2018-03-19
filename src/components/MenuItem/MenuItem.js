import React from 'react'
import { ListItem } from 'react-native-material-ui';
import Icon from '../Icon'

const MenuItem = (props) => (
    <ListItem
        leftElement={<Icon name={props.icon} pureIcon />}
        centerElement={{
            primaryText: props.text,
        }}
        onPress={props.onPress}
    />
)

export default MenuItem