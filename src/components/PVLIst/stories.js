import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';
import { ScrollView } from 'react-native'

import PVList from './index'
import mockPVs from './mock'

storiesOf('PVList', module)
    .addDecorator(getStory => <ScrollView>{getStory()}</ScrollView>)
    .add('all', () => (
        <PVList pvs={mockPVs.pvs} />
    ))
    .add('Only original', () => (
        <PVList pvs={mockPVs.pvs} type='Original' title='Original' />
    ))
    .add('Only youtube', () => (
        <PVList pvs={mockPVs.pvs} service='Youtube' title='Youtube' />
    ));