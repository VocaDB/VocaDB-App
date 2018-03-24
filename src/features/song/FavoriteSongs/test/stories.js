import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import FavoriteSongs from '../FavoriteSongs'
import * as mockGenerator from '../../../../common/helper/mockGenerator'

const song1 = mockGenerator.CreateSong({ id: 1 })
const song2 = mockGenerator.CreateSong({ id: 2 })
const songs = [ song1, song2 ]

storiesOf('Song/FavoriteSongs', module)
    .add('with data', () => (
        <FavoriteSongs songs={songs} />
    ));