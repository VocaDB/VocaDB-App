import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';
import { ScrollView } from 'react-native'

import Lyric from '../LyricContent'
import * as mockLyric from './mock'

storiesOf('Lyric/LyricContent', module)
    .addDecorator(getStory => <ScrollView>{getStory()}</ScrollView>)
    .add('in Jp', () => (
        <Lyric
            content={mockLyric.lyricJp.value}
        />
    ));