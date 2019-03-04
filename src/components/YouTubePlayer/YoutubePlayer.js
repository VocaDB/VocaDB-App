import React from 'react';
import { View, Text, WebView, AppState } from 'react-native';
import PropTypes from 'prop-types';

const Player = require('./player.html');

class YoutubePlayer extends React.Component {

    state = {
        appState: AppState.currentState
    }
  
    componentDidMount() {
        AppState.addEventListener('change', this._handleAppStateChange);
    }
  
    componentWillUnmount() {
        AppState.removeEventListener('change', this._handleAppStateChange);
    }
  
    _handleAppStateChange = (nextAppState) => {        
        this.setState({appState: nextAppState});
    }
  
    render () {

        return (
            <View style={{ height: 260 }}>

                {this.state.appState == 'active' &&
                    <WebView
                        style={{flex:1}}
                        javaScriptEnabled={true}
                        mediaPlaybackRequiresUserAction={true}
                        allowsInlineMediaPlayback={true}
                        source={{uri: `https://www.youtube.com/embed/${this.props.pvId}?playsinline=1`}}
                    />
                }

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