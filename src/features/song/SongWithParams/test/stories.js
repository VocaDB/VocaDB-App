import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';
import { Provider } from 'react-redux'
import store from './../../../../app/appStore'
import SongWithParams from '../SongWithParams'
import * as mockGenerator from '../../../../common/helper/mockGenerator'

const mockSongs = [
    mockGenerator.CreateSong({ id: 1 }),
    mockGenerator.CreateSong({ id: 2 }),
    mockGenerator.CreateSong({ id: 3 }),
    mockGenerator.CreateSong({ id: 4 })
]

storiesOf('Song/SongWithParams', module)
    .add('normal', () => (
        <Provider store={store}>
            <SongWithParams songs={mockSongs} />
        </Provider>
    ));