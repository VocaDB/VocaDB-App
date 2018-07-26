import React from 'react'
import { View, Text, WebView } from 'react-native'
import PropTypes from 'prop-types'
const Player = require('./player.html');

class NNDPlayer extends React.Component {
    render () {

        const callJavascript = `createVideo("${this.props.pvId}")`

        return (
            <View style={{ height: 260 }}>
                <WebView
                    scalesPageToFit={true}
                    bounces={false}
                    scrollEnabled={true}
                    injectedJavaScript={callJavascript}
                    source={Player}
                    style={{ flex: 1 }}
                />
            </View>
        )
    }
}

NNDPlayer.propTypes = {
    pvId : PropTypes.string
}

NNDPlayer.defaultProps = {
    pvId : ''
}

export default NNDPlayer