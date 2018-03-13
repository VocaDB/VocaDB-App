import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import SongFilter from '../SongFilter'

storiesOf('Song/SongFilter', module)
    .add('init', () => (
        <SongFilter
            onPressSave={action('Press save')}
            onPressBack={action('Press back')}
        />
    ));