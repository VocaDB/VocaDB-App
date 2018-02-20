import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import Home from '../component'
import { recentSongs, popularSongs, popularAlbums, latestEvents } from './mock'


const navigate = action('navigate')

storiesOf('Pages/Home', module)
    .add('general', () => (
        <Home
            refreshing={false}
            recentSongs={recentSongs}
            popularSongs={popularSongs}
            popularAlbums={popularAlbums}
            latestEvents={latestEvents}
            onPressSong={action('Select song')}
            onPressAlbum={action('Select album')}
            fetchRecentSongs={action('Fetch recent songs')}
            fetchPopularSongs={action('Fetch popular songs')}
            fetchLatestEvents={action('Fetch latest events')}
            fetchRecentAlbums={action('Fetch recent albums')}
            navigation={{ navigate }}
        />
    ));