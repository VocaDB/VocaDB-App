import React from 'react';
import { View, WebView } from 'react-native';
import PropTypes from 'prop-types';

class BBPlayer extends React.Component {
    render () {

        if(!this.props.pvId && this.props.cid) {
            return null;
        }

        return (
            <View style={{ height: 260 }}>
                <WebView
                    style={{flex:1}}
                    javaScriptEnabled={true}
                    mediaPlaybackRequiresUserAction={false}
                    source={{uri: `https://player.bilibili.com/player.html?aid=${this.props.pvId}&cid=${this.props.cid}&page=1`}}
                />
            </View>
        )
    }
}

BBPlayer.propTypes = {
    pvId : PropTypes.string,
    cid: PropTypes.number
}

BBPlayer.defaultProps = {
    pvId : ''
}

export default BBPlayer;