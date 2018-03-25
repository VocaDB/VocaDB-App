import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import SongHorizontalList from '../SongHorizontalList'
import CenterView from '../../../../components/CenterView/index'
import mockSongs from './mock'

storiesOf('Song/SongHorizontalList', module)
    .addDecorator(getStory => <CenterView>{getStory()}</CenterView>)
    .add('empty', () => (
        <SongHorizontalList />
    ))
    .add('with info', () => (
        <SongHorizontalList songs={mockSongs.items} />
    ));