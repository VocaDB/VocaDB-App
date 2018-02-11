import React from 'react'
import { addNavigationHelpers, NavigationActions, StackNavigator, DrawerNavigator } from "react-navigation";
import { connect } from 'react-redux'
import { BackHandler } from "react-native";
import PropTypes from 'prop-types'
import route from './route'
import DrawerItem from './pages/Drawer/component'
import {
    createReduxBoundAddListener
} from 'react-navigation-redux-helpers';

export const AppNavigator = StackNavigator(route)

class AppNavigationState extends React.Component {

    componentDidMount() {
        BackHandler.addEventListener("hardwareBackPress", this.onBackPress);
    }
    componentWillUnmount() {
        BackHandler.removeEventListener("hardwareBackPress", this.onBackPress);
    }
    onBackPress = () => {
        const { dispatch, nav } = this.props;
        if (nav.index === 0) {
            return false;
        }
        dispatch(NavigationActions.back());
        return true;
    };

  render () {
      const { dispatch, nav } = this.props;
      const addListener = createReduxBoundAddListener("root");

      const navigation = addNavigationHelpers({
          dispatch,
          state: nav,
          addListener
      });

      return <AppNavigator navigation={navigation} />;
  }
}

AppNavigationState.propTypes = {
  dispatch: PropTypes.func.isRequired,
  nav: PropTypes.object.isRequired
}

const mapStateToProps = state => ({
  // nav: state.nav
    nav: state.get('nav').toJS()
})

export default connect(mapStateToProps)(AppNavigationState)
