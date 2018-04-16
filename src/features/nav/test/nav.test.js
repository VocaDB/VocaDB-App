import navReducer from './../navReducer'
import { addNavigationHelpers, NavigationActions } from 'react-navigation';
import Routes from './../../../app/appRoutes'

describe('Test navigation', () => {
    it('should add next route', () => {

        let nextState = navReducer(undefined, NavigationActions.navigate(Routes.Main));

        expect(nextState).toBeTruthy()
        expect(nextState.index).toEqual(0)
        nextState = navReducer(nextState, NavigationActions.navigate({ routeName: Routes.SongDetail }));

        expect(nextState).toBeTruthy()
        expect(nextState.index).toEqual(1)
    })
})