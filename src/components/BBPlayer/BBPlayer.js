import React from 'react';
import { View, WebView } from 'react-native';
import PropTypes from 'prop-types';

class BBPlayer extends React.Component {
    render () {

        return (
            <View style={{ height: 260 }}>
                <WebView
                    style={{flex:1}}
                    javaScriptEnabled={true}
                    mediaPlaybackRequiresUserAction={false}
                    source={{uri: `https://player.bilibili.com/player.html?aid=26644164&cid=45826705&page=1`}}
                />
            </View>
        )
    }
}

BBPlayer.propTypes = {
    pvId : PropTypes.string
}

BBPlayer.defaultProps = {
    pvId : ''
}

export default BBPlayer;