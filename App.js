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
import firebase from 'react-native-firebase';

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
        this.getToken();
        this.initFirebase();
        firebase.messaging().subscribeToTopic('artist_1');
    }

    getToken() {
        firebase.messaging().getToken()
            .then(fcmToken => {
                console.log(`token : ${fcmToken}`)
            });
    }

    initFirebase() {

        firebase.messaging().hasPermission()
            .then(enabled => {

                console.log('is enabled? : ' + enabled)
                if (!enabled) {
                    firebase.messaging().requestPermission()
                        .then(() => {
                            // User has authorised
                            console.log('user authorised');
                        })
                        .catch(error => {
                            // User has rejected permissions
                            console.log(error);
                        });
                } else {
                    console.log('permiossion exists')
                }
            });

    }

    componentDidMount() {

        this.notificationDisplayedListener = firebase.notifications().onNotificationDisplayed((notification) => {
            // Process your notification as required
            // ANDROID: Remote notifications do not contain the channel ID. You will have to specify this manually if you'd like to re-display the notification.
            console.log('onNotificationDisplayed')
            console.log(notification)
        });
        this.notificationListener = firebase.notifications().onNotification((notification) => {
            // Process your notification as required
            console.log('onNotification')
            console.log(notification)
        });


        this.messageListener = firebase.messaging().onMessage(m => {
            // Process your message as required
            console.log('onMessage')
            console.log(JSON.stringify(m))
        });

        this.notificationOpenedListener = firebase.notifications().onNotificationOpened((notificationOpen) => {
            console.log('onNotificationOpened')
            console.log(notificationOpen)
        });

        firebase.messaging().subscribeToTopic('artist_1');
    }

    componentWillUnmount() {
        this.messageListener();
        this.notificationDisplayedListener();
        this.notificationListener();
        this.notificationOpenedListener();
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