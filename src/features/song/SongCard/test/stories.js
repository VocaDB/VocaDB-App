import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import SongCard from '../SongCard'
import CenterView from '../../../../components/CenterView/index'

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
    ));