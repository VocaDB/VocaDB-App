import React from 'react'
import { View, Text } from 'react-native'
import Divider from '../../../components/Divider'
import MenuItem from './../../../components/MenuItem'
import { Button } from 'react-native-material-ui';
import Theme from '../../../theme'
import CenterView from '../../../components/CenterView'
import PropTypes from 'prop-types'

class MenuTab extends React.PureComponent {
    render () {
        return (
            <View style={{ flex: 1 }}>
                <View style={{ flex: 1, backgroundColor: 'white' }}>
                    {this.props.menus.map(props => <MenuItem key={props.text} { ...props } />)}
                </View>
            </View>
        )
    }
}

MenuTab.propTypes = {
    menus: PropTypes.arrayOf(PropTypes.object)
}

MenuTab.defaultProps = {
    menus: []
}
/*
 [
  { icon: 'ios-musical-notes', text: 'Favorite songs', onPress: onPressSongs }
 ]
 */

export default MenuTab