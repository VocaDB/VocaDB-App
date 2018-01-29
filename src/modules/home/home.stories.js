import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';
import Songs from './../../sample/songList'
import Albums from './../../sample/albums'
import Events from './../../sample/events'

import HomeView from './home.component'

storiesOf('Page', module)
    .add('Home', () => (
        <HomeView
            loading={false}
            error={false}
            songs={Songs.items}
            albums={Albums.items}
            events={Events.items}
            fetchSongs={action('fetch song')}
            fetchRecentAlbums={action('fetch recent albums')}
            fetchEvents={action('fetch events')}
            viewSong={action('view song')}
            viewAlbum={action('view album')}
            viewSearch={action('view search')}
        />
    ));