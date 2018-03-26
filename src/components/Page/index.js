import React from 'react'
import { View, Text, StatusBar, Platform } from 'react-native'
import Theme from './../../theme'
import { Constants } from 'expo'
import { SafeAreaView } from 'react-navigation'

class Page extends React.PureComponent {
    render () {
        if(Platform.OS === 'ios') {
            return (
                <SafeAreaView style={{ flex: 1, backgroundColor: Theme.rootBackgroundColor }}>
                    {this.props.children}
                </SafeAreaView>
            )
        } else {
            return (
                <View style={{ flex: 1 }}>
                    <View style={{ height: Constants.statusBarHeight, backgroundColor: Theme.statusBarColor }}></View>
                    <View style={{ flex: 1, backgroundColor: Theme.rootBackgroundColor }}>
                        {this.props.children}
                    </View>
                </View>
            )
        }
    }
}

export default Page