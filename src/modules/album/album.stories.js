import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';
import Album from './../../sample/album'

import AlbumView from './album.component'

storiesOf('Page', module)
    .add('Album', () => (
        <AlbumView
            id={1}
            loading={false}
            error={false}
            album={Album}
            back={action('pressed back')}
            getAlbum={action('get album')}
            viewSearch={action('pressed search')}
            viewArtist={action('pressed view artist')}
            viewSong={action('pressed view song')}
        />
    ));