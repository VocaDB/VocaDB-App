import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import SongSearch from '../SongSearch'

import * as mockGenerator from '../../../../common/helper/mockGenerator'

const song1 = mockGenerator.CreateSong({ id: 1 })
const mockSongs = [
    mockGenerator.CreateSong({ id: 1 }),
    mockGenerator.CreateSong({ id: 2 }),
    mockGenerator.CreateSong({ id: 3 }),
    mockGenerator.CreateSong({ id: 4 })
]

storiesOf('Song/SongSearch', module)
    .add('empty', () => (
        <SongSearch />
    ))
    .add('params with result', () => (
        <SongSearch
            title='Latest song'
            fetchSongs={action('Fetch song by params')}
            searchable={false}
            songs={mockSongs}
            loading={false}
            navigation={{ state: { params: {} } }}
        />
    ))
    .add('searchable initial', () => (
        <SongSearch
            fetchSongs={action('Fetch song by params')}
            searchable={true}
            loading={false}
            navigation={{ state: { params: {} } }}
        />
    ))
    .add('searchable', () => (
        <SongSearch
            fetchSongs={action('Fetch song by params')}
            searchable={true}
            songs={mockSongs}
            loading={false}
            navigation={{ state: { params: {} } }}
        />
    ));