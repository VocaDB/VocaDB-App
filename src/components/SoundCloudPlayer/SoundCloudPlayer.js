import React from 'react';
import { View, WebView } from 'react-native';
import PropTypes from 'prop-types';

class SoundCloudPlayer extends React.Component {
    render () {

        return (
            <View style={{ height: 260 }}>
                <WebView
                    style={{flex:1}}
                    javaScriptEnabled={true}
                    mediaPlaybackRequiresUserAction={false}
                    source={{uri: `https://w.soundcloud.com/player/?url=https%3A%2F%2Fapi.soundcloud.com%2Ftracks%${this.props.pvId}&auto_play=false&show_artwork=true&color=ff7700`}}
                />
            </View>
        )
    }
}

SoundCloudPlayer.propTypes = {
    pvId : PropTypes.string
}

SoundCloudPlayer.defaultProps = {
    pvId : ''
}

export default SoundCloudPlayer;