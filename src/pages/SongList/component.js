import React from 'react'
import { View, Text, Button } from 'react-native'

export default class SongListPage extends React.Component {

    componentDidMount () {
    }

    render () {
        return (
            <View>
                <Text>SongListPage</Text>
                <Text>SongListPage</Text>
                <Button title="Open Drawer" onPress={() => this.props.navigation.navigate('DrawerOpen')} />
                <Button title="To Detail" onPress={() => this.props.navigation.navigate('SongDetail')} />
            </View>
        )
    }
}