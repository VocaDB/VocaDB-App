import React from 'react'
import { Font } from 'expo';
import Song from './song/song.container'

class Playground extends React.Component {

    state = {
        fontLoaded: false,
    };

    componentWillMount() {
        Font.loadAsync({
            'Roboto': require('native-base/Fonts/Roboto.ttf'),
            'Roboto_medium': require('native-base/Fonts/Roboto_medium.ttf'),
        }).then(() => {
            this.setState({ fontLoaded: true });
        });
    }

    render() {
        return (this.state.fontLoaded) ? (<Song />) : null
    }
}

export default Playground
