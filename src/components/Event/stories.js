import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import Event from './index'
import CenterView from './../CenterView'
import images from './../../assets/images'

storiesOf('Event', module)
    .addDecorator(getStory => <CenterView type='vertical'>{getStory()}</CenterView>)
    .add('general', () => (
        <Event
            name='"666" NUMBER TRIPLE SIX'
            onPress={action("Press event")}
        />
    ));