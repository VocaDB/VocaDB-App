import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';
import { View, Text } from 'react-native'

import Empty from '../Empty'

storiesOf('Components/Empty', module)
    .add('default', () => (<Empty />))
    .add('with text', () => (<Empty text='Result not found' />))
    .add('with icon', () => (<Empty text='Result not found' icon='ios-search' />))