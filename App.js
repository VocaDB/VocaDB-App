import React from 'react'
import AppNav from './src/AppNavigator'
import { Provider } from 'react-redux'
import store from './src/store'
import { StyleProvider } from 'native-base'
import StorybookUI from './storybook';

const App = () => (
    <Provider store={store}>
            <AppNav />
    </Provider>
)

// export default App
module.exports = __DEV__ ? StorybookUI : App;