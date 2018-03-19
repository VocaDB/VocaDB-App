import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import Main from '../Main'
import { recentSongs, popularSongs, popularAlbums, latestEvents } from './mock'


const navigate = action('navigate')

storiesOf('Main/Main', module)
    .add('general', () => (
        <Main
            refreshing={false}
            recentSongs={recentSongs}
            popularSongs={popularSongs}
            popularAlbums={popularAlbums}
            latestEvents={latestEvents}
            recentAlbums={popularAlbums}
            onPressSong={action('Select song')}
            onPressAlbum={action('Select album')}
            fetchRecentSongs={action('Fetch recent songs')}
            fetchPopularSongs={action('Fetch popular songs')}
            fetchLatestEvents={action('Fetch latest events')}
            fetchRecentAlbums={action('Fetch recent albums')}
            fetchFollowedSongs={action('Fetch followed songs')}
            navigation={{ navigate }}
        />
    ));