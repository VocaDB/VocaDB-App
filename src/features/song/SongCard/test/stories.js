import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import SongCard from '../SongCard'
import CenterView from '../../../../components/CenterView/index'
import * as mockGenerator from './../../../../common/helper/mockGenerator'

const pvs = [
    mockGenerator.CreatePV({ id: 1, service: 'Youtube', pvType: 'Original' }),
    mockGenerator.CreatePV({ id: 2, service: 'NicoNicoDouga', pvType: 'Original' }),
    mockGenerator.CreatePV({ id: 3, service: 'NicoNicoDouga', pvType: 'Other' }),
    mockGenerator.CreatePV({ id: 4, service: 'Soundcloud', pvType: 'Original' })
]

storiesOf('Song/SongCard', module)
    .addDecorator(getStory => <CenterView>{getStory()}</CenterView>)
    .add('empty', () => (
        <SongCard />
    ))
    .add('with info', () => (
        <SongCard
            image='http://tn-skr4.smilevideo.jp/smile?i=1715919'
            name='Melt'
            artist='Hatsune Miku'
            onPress={() => action("Press song")}
        />
    ))
    .add('with PVs', () => (
        <SongCard
            image='http://tn-skr4.smilevideo.jp/smile?i=1715919'
            name='Melt'
            artist='Hatsune Miku'
            pvs={pvs}
            onPress={() => action("Press song")}
        />
    ));