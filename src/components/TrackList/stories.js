import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';
import { View } from 'react-native'

import TrackList from './index'
import CenterView from './../CenterView'
import { singleDiscTracks, multiDiscTracks} from './mock'

storiesOf('TrackList', module)
    .add('Single disc', () => (
        <TrackList tracks={singleDiscTracks} />
    ))
    .add('Multi disc', () => (
        <TrackList tracks={multiDiscTracks} />
    ));