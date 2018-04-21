import React from 'react'
import AppNav from './src/AppNavigator'
import AppNavWithState from './src/app/AppWithNavigationState'
import { Provider } from 'react-redux'
import appStore from './src/app/appStore'
import { PersistGate } from 'redux-persist/integration/react'
import { StyleProvider } from 'native-base'
import { View } from 'react-native'
import StorybookUI from './storybook';
import { COLOR, ThemeProvider } from 'react-native-material-ui';

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


class App extends React.Component {
    constructor(props) {
        super(props)
    }

    render () {
        return (
            <ThemeProvider uiTheme={uiTheme}>
                    <Provider store={appStore().store}>
                        <PersistGate loading={null} persistor={appStore().persistor}>
                            <AppNavWithState />
                        </PersistGate>
                    </Provider>
            </ThemeProvider>
        )
    }
}

export default App
// module.exports = __DEV__ ? StorybookUI : App;