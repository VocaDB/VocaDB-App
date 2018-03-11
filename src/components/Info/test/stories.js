import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import Info from '../index'
import CenterView from '../../CenterView/index'

storiesOf('Components/Info', module)
    .add('normal', () => (
        <Info name='Type' value='Original' />
    ));