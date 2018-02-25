import React from 'react'
import { TouchableOpacity, Text, Linking } from 'react-native'
import PropTypes from 'prop-types'
import Theme from './../../theme'
import Icon from './../../components/Icon'
import { ListItem, Button } from 'react-native-material-ui';

class WebLink extends React.Component {
    render () {
        return (
            <ListItem
                leftElement={<Icon name='ios-globe' pureIcon />}
                centerElement={{
                    primaryText: this.props.name,
                }}
                onPress={() => Linking.openURL(this.props.url).catch(err => console.error('An error occurred', err))}
            />
        )
    }
}

WebLink.propTypes = {
    name: PropTypes.string,
    url: PropTypes.string
}

export default WebLink