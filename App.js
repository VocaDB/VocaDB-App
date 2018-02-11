import React from 'react'
import AppNavigationState from './src/AppNavigator'
import AppNav from './src/AppNavigator'
import { Provider } from 'react-redux'
import store from './src/store'
import { StyleProvider } from 'native-base'
import getTheme from './native-base-theme/components';
import material from './native-base-theme/variables/material';
import StorybookUI from './storybook';

const App = () => (
    <StyleProvider  style={getTheme(material)}>
            <Provider store={store}>
                    <AppNav />
            </Provider>
    </StyleProvider>
)

// export default App
module.exports = __DEV__ ? StorybookUI : App;