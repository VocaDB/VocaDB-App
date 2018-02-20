import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import Icon from './index'
import CenterView from './../CenterView'

storiesOf('Icon', module)
    .addDecorator(getStory => <CenterView>{getStory()}</CenterView>)
    .add('alone', () => (
        <Icon name='rocket' />
    ))
    .add('with text', () => (
        <Icon name='share' text='Share' />
    ));