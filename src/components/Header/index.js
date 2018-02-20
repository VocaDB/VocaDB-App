import React from 'react'
import { View, Text } from 'react-native'
import { statusBarColor } from './../../theme'
import { Constants } from 'expo'

class Header extends React.Component {
    render () {
        return (<View>
            <View style={{ height: Constants.statusBarHeight, backgroundColor: statusBarColor }}></View>
            {this.props.children}
        </View>)
    }
}

export default Header