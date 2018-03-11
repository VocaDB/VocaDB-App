import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import AlbumDetail from '../AlbumDetail'
import mockAlbum from './mock'

storiesOf('Album/AlbumDetail', module)
    .add('general', () => (
        <AlbumDetail
            id={1}
            album={mockAlbum}
            loading={false}
            fetchAlbum={action('Fetch album')}
            onPressTag={action('Press Tags')}
            onPressSong={action('Press song')}
            onPressArtist={action('Press artist')}
            onPressEvent={action('Press event')}
        />
    ));