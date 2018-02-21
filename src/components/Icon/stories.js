import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import Icon from './index'
import CenterView from './../CenterView'

storiesOf('Icon', module)
    .addDecorator(getStory => <CenterView>{getStory()}</CenterView>)
    .add('alone', () => (
        <Icon name='ios-share' />
    ))
    .add('with text', () => (
        <Icon name='ios-share' text='Share' />
    ));