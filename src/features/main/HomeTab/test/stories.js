import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import HomeTab from '../HomeTab'

storiesOf('Main/HomeTab', module)
    .add('normal', () => (
        <HomeTab />
    ));