import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';
import { View } from 'react-native'

import Tag from './index'
import CenterView from './../CenterView'

storiesOf('Tag', module)
    .addDecorator(getStory => <CenterView>{getStory()}</CenterView>)
    .add('with name', () => (
        <Tag name='Project Diva' />
    ));