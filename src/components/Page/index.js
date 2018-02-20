import React from 'react'
import { View, Text, StatusBar, Platform } from 'react-native'
import { statusBarColor } from './../../theme'
import { Constants } from 'expo'
import { SafeAreaView } from 'react-navigation'
import { rootBackgroundColor } from './../../theme'

class Page extends React.Component {
    render () {
        if(Platform.OS === 'ios') {
            return (
                <SafeAreaView style={{ flex: 1, backgroundColor: rootBackgroundColor }}>
                    {this.props.children}
                </SafeAreaView>
            )
        } else {
            return (
                <View style={{ flex: 1 }}>
                    <View style={{ height: Constants.statusBarHeight, backgroundColor: statusBarColor }}></View>
                    <View style={{ flex: 1, backgroundColor: rootBackgroundColor }}>
                        {this.props.children}
                    </View>
                </View>
            )
        }
    }
}

export default Page