import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import SongListPage from '../component'
import mockEntries from './mock'

storiesOf('Pages/SongList', module)
    .add('with result', () => (
        <SongListPage
            title='Latest song'
            fetchSongs={action('Fetch song by params')}
            searchable={false}
        />
    ));