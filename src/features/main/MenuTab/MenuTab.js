import React from 'react'
import { View, Text } from 'react-native'
import MenuItem from './../../../components/MenuItem'
import PropTypes from 'prop-types'
import pack from './../../../../package.json'

class MenuTab extends React.PureComponent {
    render () {
        return (
            <View style={{ flex: 1 }}>
                <View style={{ flex: 1, backgroundColor: 'white' }}>
                    {this.props.menus.map(props => <MenuItem key={props.text} { ...props } />)}
                </View>
                <View style={{ height: 40, alignItems: 'center', backgroundColor: 'white' }}>
                    <Text>version {pack.version}</Text>
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

export default MenuTab