import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';
import { View } from 'react-native'

import Settings from '../Settings'

storiesOf('User/Settings', module)
    .add('default', () => (
        <Settings />
    ));