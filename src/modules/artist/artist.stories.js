import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';
import Artist from './../../sample/artist'

import ArtistView from './artist.component'

storiesOf('Page', module)
    .add('Artist', () => (
        <ArtistView
            id={1}
            loading={false}
            error={false}
            artist={Artist}
            back={action('pressed back')}
            getArtist={action('get artist')}
            viewSearch={action('view search')}
            viewAlbum={action('view album')}
        />
    ));