import React from 'react'
import AppNavigationState from './src/AppNavigator'
import { Provider } from 'react-redux'
import store from './src/store'
import { StyleProvider } from 'native-base'
import getTheme from './native-base-theme/components';
import material from './native-base-theme/variables/material';

const App = () => (
    <StyleProvider  style={getTheme(material)}>
            <Provider store={store}>
                    <AppNavigationState />
            </Provider>
    </StyleProvider>
)

export default App
