import AppNavigator, { INITIAL_ROUTE } from './../../AppNavigator';
import firebase from 'react-native-firebase';

const initialState = AppNavigator.router.getStateForAction(AppNavigator.router.getActionForPathAndParams(INITIAL_ROUTE));

const navReducer = (state = initialState, action) => {
    const nextState = AppNavigator.router.getStateForAction(action, state);

    if(action && action.routeName) {
        firebase.analytics().logEvent(`Page_${action.routeName}`, (action.params)? action.params : {});
    }

    // Simply return the original `state` if `nextState` is null or undefined.
    return nextState || state;
};

export default navReducer