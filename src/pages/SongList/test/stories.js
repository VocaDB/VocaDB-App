import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import SongListPage from '../component'

import * as mockGenerator from './../../../common/helper/mockGenerator'

const song1 = mockGenerator.CreateSong({ id: 1 })
const mockSongs = [
    mockGenerator.CreateSong({ id: 1 }),
    mockGenerator.CreateSong({ id: 2 }),
    mockGenerator.CreateSong({ id: 3 }),
    mockGenerator.CreateSong({ id: 4 })
]

storiesOf('Pages/SongList', module)
    .add('with result', () => (
        <SongListPage
            title='Latest song'
            fetchSongs={action('Fetch song by params')}
            searchable={false}
            songs={mockSongs}
            loading={false}
            navigation={{ state: { params: {} } }}
        />
    ))
    .add('searchable', () => (
        <SongListPage
            fetchSongs={action('Fetch song by params')}
            searchable={true}
            songs={mockSongs}
            loading={false}
            navigation={{ state: { params: {} } }}
        />
    ));