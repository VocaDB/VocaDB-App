import React from 'react';
import AppNavWithState from './src/app/AppWithNavigationState';
import { Provider } from 'react-redux';
import appStore from './src/app/appStore';
import { PersistGate } from 'redux-persist/integration/react';
import StorybookUI from './storybook';
import { COLOR, ThemeProvider } from 'react-native-material-ui';
import QuickActions from 'react-native-quick-actions';
import i18n from './src/common/i18n';
import nativeI18N from 'react-native-i18n';
import moment from 'moment';
import 'moment/min/locales';

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

QuickActions.setShortcutItems([
    {
        type: "Songs",
        title: i18n.findSong,
        icon: "song",
        userInfo: {
            url: "vocadb://songs"
        }
    },
    {
        type: "Artists",
        title: i18n.findArtist,
        icon: "artist",
        userInfo: {
            url: "vocadb://artists"
        }
    },
    {
        type: "Albums",
        title: i18n.findAlbum,
        icon: "album",
        userInfo: {
            url: "vocadb://albums"
        }
    }
]);

const chooseMomentLocale = (locale) => {
    locale = locale.toLowerCase();
    if (moment.locales().includes(locale)) {
        return locale;
    } else if (moment.locales().includes(locale.substring(0, 2))) {
        return locale.substring(0, 2);
    }
    return 'en';
};


class App extends React.Component {
    constructor(props) {
        super(props);
    }

    componentWillMount () {
        moment.locale(chooseMomentLocale(nativeI18N.currentLocale()));
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