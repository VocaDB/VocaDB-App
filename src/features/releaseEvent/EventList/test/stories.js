import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';
import { ScrollView } from 'react-native'

import EventList from '../index'
import mockEvents from './mock'

storiesOf('Event/EventList', module)
    .addDecorator(getStory => <ScrollView>{getStory()}</ScrollView>)
    .add('with items', () => (
        <EventList
            events={mockEvents.items}
            onPressItem={action('press event')}
        />
    ));