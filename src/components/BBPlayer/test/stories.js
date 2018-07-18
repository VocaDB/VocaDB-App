import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import BBPlayer from '../BBPlayer';
import { View } from 'react-native';

storiesOf('Components/BBPlayer', module)
    .add('general', () => (
        <BBPlayer pvId='26644164' />
    ));