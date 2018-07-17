import React from 'react';
import { View, Text, WebView } from 'react-native';
import PropTypes from 'prop-types';

const Player = require('./player.html');

class YoutubePlayer extends React.Component {
    render () {

        return (
            <View style={{ height: 260 }}>
                <WebView
                    style={{flex:1}}
                    javaScriptEnabled={true}
                    mediaPlaybackRequiresUserAction={false}
                    source={{uri: `https://www.youtube.com/embed/${this.props.pvId}`}}
                />
            </View>
        )
    }
}

YoutubePlayer.propTypes = {
    pvId : PropTypes.string
}

YoutubePlayer.defaultProps = {
    pvId : ''
}

export default YoutubePlayer;