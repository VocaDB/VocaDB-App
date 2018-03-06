import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import SongDetail from '../component'
import mockSong from './mock'

const artists = mockSong.artists.map(artistRole => artistRole.artist)

const navigate = action('navigate')

storiesOf('Pages/SongDetail', module)
    .add('general', () => (
        <SongDetail
            id={1032}
            fetchSong={action('Fetch song')}
            song={mockSong}
            artists={artists}
            navigation={{ navigate, state : { params: { id: 1 } } }}
            onPressLine={action('Press like')}
            onPressShare={action('Press share')}
            onPressWebLink={action('Press web link')}
            onPressArtist={action('Press artist')}
            onPressAlbum={action('Press album')}
            onPressTag={action('Press tag')}
        />
    ))
    .add('empty', () => (
        <SongDetail
            id={0}
            fetchSong={action('Fetch song')}
            song={{}}
            onPressLine={action('Press like')}
            onPressShare={action('Press share')}
            onPressWebLink={action('Press web link')}
            onPressArtist={action('Press artist')}
            onPressAlbum={action('Press album')}
            onPressTag={action('Press tag')}
        />
    ))
    .add('loading', () => (
        <SongDetail
            id={1032}
            loading={true}
            fetchSong={action('Fetch song')}
            song={mockSong}
            artists={artists}
            navigation={{ navigate, state : { params: { id: 1 } } }}
            onPressLine={action('Press like')}
            onPressShare={action('Press share')}
            onPressWebLink={action('Press web link')}
            onPressArtist={action('Press artist')}
            onPressAlbum={action('Press album')}
            onPressTag={action('Press tag')}
        />
    ));