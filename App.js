import React from 'react'
import AppNav from './src/AppNavigator'
import { Provider } from 'react-redux'
import store from './src/store'
import { StyleProvider } from 'native-base'
import { View } from 'react-native'
import StorybookUI from './storybook';

class App extends React.Component {
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

    render () {

        if(!this.state.fontLoaded) {
            return (<View />)
        }

        return (
            <Provider store={store}>
                <AppNav />
            </Provider>
        )
    }
}

// export default App
module.exports = __DEV__ ? StorybookUI : App;