import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import YoutubePlayer from '../YoutubePlayer';
import { View } from 'react-native';

storiesOf('Components/YoutubePlayer', module)
    .add('normal', () => (
        <YoutubePlayer pvId='ll0arX6EZaw' />
    ));