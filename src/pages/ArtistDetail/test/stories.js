import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import ArtistDetail from '../component'
import mockArtist from './mock'

storiesOf('Pages/ArtistDetail', module)
    .add('general', () => (
        <ArtistDetail
            id={1}
            artist={mockArtist}
            loading={false}
            fetchArtist={action('Fetch artist')}
            onPressTag={action('Press Tag')}
            onPressSong={action('Press song')}
            onPressAlbum={action('Press album')}
            onPressEvent={action('Press event')}
        />
    ));