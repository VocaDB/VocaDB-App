import { AppNavigator } from '~/AppNavigator'
import { NavigationActions } from 'react-navigation'
import { DEFAULT_ROUTE } from '~/../env'
import { createAction } from 'redux-act'

const defaultRoute = DEFAULT_ROUTE

const defaultAction = AppNavigator.router.getActionForPathAndParams(defaultRoute)
const initialNavState = AppNavigator.router.getStateForAction(defaultAction)


const nav = (state = initialNavState, action) => {

  let nextState
  let nextAction = {}

  if (action.type === 'Navigation/BACK') {
    return AppNavigator.router.getStateForAction(NavigationActions.back(), state)
  } else if (action.hasOwnProperty('payload') && action.payload && action.payload.hasOwnProperty('routeName')) {
    console.log('action...........')
      console.log(action.payload)
    nextAction = { routeName: action.payload.routeName, params: action.payload }
  } else {
    nextAction = action
  }

  nextState = AppNavigator.router.getStateForAction(NavigationActions.navigate(nextAction), state)



  return nextState || state
}

export default nav
