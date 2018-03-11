import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import SongDetail from '../SongDetail'
import mockSong from './mock'

const artists = mockSong.artists.map(artistRole => artistRole.artist)

const navigate = action('navigate')

storiesOf('Song/SongDetail', module)
    .add('empty', () => (
        <SongDetail />
    ))
    .add('incomplete data', () => (
        <SongDetail
            song={{
                id: 1,
                artists: [
                    {
                        id: 1,
                        defaultName: 'abc'
                    }
                ]
            }}
        />
    ))
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