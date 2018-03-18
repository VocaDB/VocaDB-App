import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import EventCard from '../EventCard'
import CenterView from '../../../../components/CenterView/index'

storiesOf('Event/EventCard', module)
    .addDecorator(getStory => <CenterView type='vertical'>{getStory()}</CenterView>)
    .add('empty', () => (
        <EventCard />
    ))
    .add('with info', () => (
        <EventCard
            id={1677}
            name='Test Event'
            date='2018-07-12T00:00:00Z'
            onPress={action("Press event")}
            location='Somewhere I belong'
            image="https://static.vocadb.net/img/releaseevent/mainThumb/1641.png?v=2"
        />
    ));