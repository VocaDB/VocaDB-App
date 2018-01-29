import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import MediaItem from './mediaItem.component'

storiesOf('MediaItem', module)
    .add('as song', () => (
        <MediaItem
            image='http://tn-skr1.smilevideo.jp/smile?i=6666016'
            title='Sample title'
            onMediaClick={action('clicked-item')}
        />
    ))
    .add('with subtitle', () => (
        <MediaItem
            image='http://tn-skr1.smilevideo.jp/smile?i=6666016'
            title='Sample title'
            subtitle='miku'
            onMediaClick={action('clicked-item')}
        />
    ));