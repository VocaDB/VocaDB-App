/* eslint-disable global-require */
import React, { Component } from 'react';
import { AppRegistry, View } from 'react-native';
import { getStorybookUI, configure } from '@storybook/react-native';
import { loadStories } from './storyLoader'
import { COLOR, ThemeProvider } from 'react-native-material-ui';
import { Font } from 'expo';

const uiTheme = {
    palette: {
        primaryColor: COLOR.indigo600,
    },
    toolbar: {
        container: {
            height: 50,
        },
    },
};

// import stories
configure(() => {
    loadStories()
}, module);

// This assumes that storybook is running on the same host as your RN packager,
// to set manually use, e.g. host: 'localhost' option
const StorybookUIRoot = getStorybookUI({ port: 7007, onDeviceUI: true });

// react-native hot module loader must take in a Class - https://github.com/facebook/react-native/issues/10991
// https://github.com/storybooks/storybook/issues/2081
// eslint-disable-next-line react/prefer-stateless-function
class StorybookUIHMRRoot extends Component {

    constructor(props) {
        super(props)
        this.state = {
            fontLoaded: false
        };
    }

    async componentDidMount() {
        await Font.loadAsync({
            'Roboto': require('native-base/Fonts/Roboto.ttf'),
            'Roboto_medium': require('native-base/Fonts/Roboto_medium.ttf'),
        });

        this.setState({ fontLoaded: true });
    }


  render() {

        if(!this.state.fontLoaded) {
            return (<View />)
        }

    return (
        <ThemeProvider uiTheme={uiTheme}>
            <StorybookUIRoot />
        </ThemeProvider>
    );
  }
}

AppRegistry.registerComponent('%APP_NAME%', () => StorybookUIHMRRoot);
export default StorybookUIHMRRoot;
