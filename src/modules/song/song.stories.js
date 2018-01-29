import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';
import SampleSong from './../../sample/song'

import SongView from './song.component'

storiesOf('Page', module)
    .add('Song', () => (
        <SongView
            id={1032}
            loading={false}
            error={false}
            song={SampleSong}
            back={action('pressed back')}
            getSong={action('get song')}
            viewSearch={action('pressed search')}
            viewArtist={action('pressed view artist')}
        />
    ));