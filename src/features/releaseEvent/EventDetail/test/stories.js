import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import EventDetail from '../EventDetail'
import * as mockGenerator from '../../../../common/helper/mockGenerator'

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
    ));