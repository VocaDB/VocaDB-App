import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';
import { ScrollView, Button } from 'react-native'

import SongRanking from '../SongRanking'
import { CreateSong } from './../../../../common/helper/mockGenerator'

const song1 = CreateSong({ id: 1 })
const song2 = CreateSong({ id: 2 })
const song3 = CreateSong({ id: 3 })

storiesOf('Song/Ranking', module)
    .add('empty', () => (
        <SongRanking />
    ))
    .add('with result', () => (
        <SongRanking songs={[song1, song2, song3]} />
    ))
    .add('with given filter', () => (
        <SongRanking
            songs={[song1, song2, song3]}
            durationHours={24}
            filterBy='Popularity'
            vocalist='Vocaloid'
        />
    ));