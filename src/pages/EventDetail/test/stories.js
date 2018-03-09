import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import EventDetailPage from '../component'
import * as mockGenerator from '../../../common/helper/mockGenerator'

const event = mockGenerator.CreateEvent()
const officialLink = mockGenerator.CreateWebLink()
event.webLinks = [ officialLink ]

const navigation = {
    state: {
        params: {
            id: 1
        }
    }
}

storiesOf('Pages/EventDetail', module)
    .add('normal', () => (
        <EventDetailPage
            loading={false}
            event={event}
            navigation={navigation}
            onPressDate={action('Press date')}
            onPressLocation={action('Press location')}
            onPressWebsite={action('Press website')}
            fetchEvent={action('Fetch event')}
        />
    ));