import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import SongRow from '../index'
import CenterView from '../../../../components/CenterView/index'

storiesOf('Song/SongRow', module)
    .addDecorator(getStory => <CenterView type='vertical'>{getStory()}</CenterView>)
    .add('empty', () => (
        <SongRow />
    ))
    .add('with data', () => (
        <SongRow
            image='https://i1.sndcdn.com/artworks-000261185615-mp8uiz-large.jpg'
            name='Melt'
            artist='Hatsune Miku'
            onPress={() => action("Press song")}
        />
    ))
    .add('with long text', () => (
        <SongRow
            image='https://i1.sndcdn.com/artworks-000261185615-mp8uiz-large.jpg'
            name='Anti Beat【UTAU cover w/ ECLIPSE_beta】'
            artist="SHASTA feat. ECLIPSE SHASTA feat. ECLIPSE"
        />
    ))
    .add('with no image', () => (
        <SongRow
            name='Melt'
            artist="Hatsune Miku"
        />
    ));