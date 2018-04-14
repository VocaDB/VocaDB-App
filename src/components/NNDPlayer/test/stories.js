import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import NNDPlayer from '../NNDPlayer'
import { View } from 'react-native'

storiesOf('Components/NNDPlayer', module)
    .add('normal', () => (
        <NNDPlayer pvId='sm33039918' />
    ));