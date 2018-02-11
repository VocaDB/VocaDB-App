import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import Song from './index'
import CenterView from './../CenterView'

storiesOf('Song', module)
    .addDecorator(getStory => <CenterView type='vertical'>{getStory()}</CenterView>)
    .add('general', () => (
        <Song
            image='https://i1.sndcdn.com/artworks-000261185615-mp8uiz-large.jpg'
            name='Melt'
            artist='Hatsune Miku'
            onPress={() => action("Press song")}
        />
    ))
    .add('with long text', () => (
        <Song
            image='https://i1.sndcdn.com/artworks-000261185615-mp8uiz-large.jpg'
            name='Anti Beat【UTAU cover w/ ECLIPSE_beta】'
            artist="SHASTA feat. ECLIPSE SHASTA feat. ECLIPSE"
        />
    ))
    .add('with no image', () => (
        <Song
            name='Melt'
            artist="Hatsune Miku"
        />
    ));