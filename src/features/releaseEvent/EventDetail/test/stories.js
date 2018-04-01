import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import EventDetail from '../EventDetail'
import * as mockGenerator from '../../../../common/helper/mockGenerator'

const event = mockGenerator.CreateEvent()
const officialLink = mockGenerator.CreateWebLink()
event.webLinks = [ officialLink ]

const songs = [
    mockGenerator.CreateSong({ id: 1 }),
    mockGenerator.CreateSong({ id: 2 }),
    mockGenerator.CreateSong({ id: 3 }),
]

const albums = [
    mockGenerator.CreateAlbum({ id: 1 }),
    mockGenerator.CreateAlbum({ id: 2 })
]

const navigation = {
    state: {
        params: {
            id: 1
        }
    }
}

storiesOf('Event/EventDetail', module)
    .add('normal', () => (
        <EventDetail
            loading={false}
            event={event}
            navigation={navigation}
            onPressDate={action('Press date')}
            onPressLocation={action('Press location')}
            onPressWebsite={action('Press website')}
            fetchEvent={action('Fetch event')}
        />
    ))
    .add('with songs', () => (
        <EventDetail
            loading={false}
            event={event}
            songs={songs}
            navigation={navigation}
            onPressDate={action('Press date')}
            onPressLocation={action('Press location')}
            onPressWebsite={action('Press website')}
            fetchEvent={action('Fetch event')}
        />
    ))
    .add('with songs and albums', () => (
        <EventDetail
            loading={false}
            event={event}
            songs={songs}
            albums={albums}
            navigation={navigation}
            onPressDate={action('Press date')}
            onPressLocation={action('Press location')}
            onPressWebsite={action('Press website')}
            fetchEvent={action('Fetch event')}
        />
    ));