import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';
import { Provider } from 'react-redux'
import store from './../../../../app/appStore'

import EventFilter from '../EventFilter'

storiesOf('Event/EventFilter', module)
    .add('default', () => (
        <EventFilter />
    ));