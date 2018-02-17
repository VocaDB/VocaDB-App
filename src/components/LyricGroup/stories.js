import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';
import { ScrollView } from 'react-native'

import LyricGroup from './index'
import mockLyrics from './mock'

storiesOf('LyricGroup', module)
    .addDecorator(getStory => <ScrollView>{getStory()}</ScrollView>)
    .add('with lyrics', () => (
        <LyricGroup
            lyrics={mockLyrics.lyrics}
        />
    ));