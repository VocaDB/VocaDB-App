import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import EventDetailPage from '../component'
import mockTag from './mock'

storiesOf('Pages/EventDetail', module)
    .add('normal', () => (
        <EventDetailPage
            event={event}
            fetchEvent={action('Fetch event')}
        />
    ));