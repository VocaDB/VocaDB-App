import { createAction } from 'redux-act'
import Routes from './../../app/appRoutes'
import { NavigationActions } from 'react-navigation';
import albumSchema from './../album/albumSchema'
import { normalize } from 'normalizr'

export const followArtist = createAction('Follow artist', artist => ({ artist }))
export const unFollowArtist = createAction('UnFollow artist', artist => ({ artist }))

export const signIn = createAction('Sign in', (username, password) => ({ username, password }))
export const signInSuccess =createAction('Sign in success', token => ({ token }))
export const saveToken = createAction('Save token', token => ({ token }))
export const skipSignIn = createAction('Skip sign in')
export const signOut = createAction('Sign out')
export const resetAction = () => NavigationActions.reset({
    index: 0,
    actions: [NavigationActions.navigate({ routeName: Routes.Main })],
});
export const resetToSignIn = () => NavigationActions.reset({
    index: 0,
    actions: [NavigationActions.navigate({ routeName: Routes.SignIn })],
});
export const fetchAlbums = createAction('Fetch albums')
export const updateAlbums = createAction('Update albums', data => normalize(data, [ { album: albumSchema } ]))
export const updateSettings = createAction('Update settings', settings => ({ settings }))
export const exportBackupData = createAction('Export backup data');
export const importBackupData = createAction('Import backup data')