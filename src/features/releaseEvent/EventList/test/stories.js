import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';
import { ScrollView } from 'react-native'

import EventList from '../EventList'
import mockEvents from './mock'

storiesOf('Event/EventList', module)
    .addDecorator(getStory => <ScrollView>{getStory()}</ScrollView>)
    .add('empty', () => (
        <EventList />
    ))
    .add('with items', () => (
        <EventList
            events={mockEvents.items}
            onPressItem={action('press event')}
        />
    ))
    .add('with title', () => (
        <EventList
            title='LATEST EVENTS'
            events={mockEvents.items}
            onPressItem={action('press event')}
        />
    ))
    .add('with max 3', () => (
        <EventList
            max={3}
            events={mockEvents.items}
            onPressItem={action('press event')}
        />
    ));