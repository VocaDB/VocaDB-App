import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';
import { ScrollView } from 'react-native'

import LyricGroup from './../LyricGroup'
import mockLyrics from './mock'

storiesOf('Lyric/LyricGroup', module)
    .addDecorator(getStory => <ScrollView>{getStory()}</ScrollView>)
    .add('Empty', () => (
        <LyricGroup lyrics={[]} />
    ))
    .add('with lyrics', () => (
        <LyricGroup
            lyrics={mockLyrics.lyrics}
        />
    ));