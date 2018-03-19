import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import MenuTab from '../MenuTab'
import CenterView from '../../../../components/CenterView/index'

storiesOf('Main/MenuTab', module)
    .add('normal', () => (
        <MenuTab />
    ));