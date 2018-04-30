import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';
import { View } from 'react-native'

import SignIn from '../SignIn'

storiesOf('User/SignIn', module)
    .add('default', () => (
        <SignIn onPressSkip={action('Press skip')} onPressSignIn={action('Press sign in')} />
    ))
    .add('loading', () => (
        <SignIn loading={true} onPressSkip={action('Press skip')} onPressSignIn={action('Press sign in')} />
    ))
    .add('error', () => (
        <SignIn error='Invalid username or password' onPressSkip={action('Press skip')} onPressSignIn={action('Press sign in')} />
    ));