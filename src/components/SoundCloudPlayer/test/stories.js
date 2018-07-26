import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import SoundCloudPlayer from '../SoundCloudPlayer';
import { View } from 'react-native';

storiesOf('Components/SoundCloudPlayer', module)
    .add('general', () => (
        <SoundCloudPlayer pvId='472275567' />
    ));