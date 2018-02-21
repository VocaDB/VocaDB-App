import React from 'react'
import { ScrollView } from 'react-native'
import Theme from './../../theme'

class Content extends React.Component {
    render () {
        return (
            <ScrollView
                refreshControl={this.props.refreshControl}
                style={{ flex: 1, backgroundColor: Theme.contentBackgroundColor }}>
                {this.props.children}
            </ScrollView>
        )
    }
}

export default Content