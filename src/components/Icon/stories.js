import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import Icon from './index'
import CenterView from './../CenterView'
import { View } from 'react-native'

storiesOf('Icon', module)
    .addDecorator(getStory => <CenterView>{getStory()}</CenterView>)
    .add('alone', () => (
        <Icon name='ios-share' />
    ))
    .add('with text', () => (
        <Icon name='ios-share' text='Share' />
    ))
    .add('site', () => (
        <View>
            <View><Icon name='NND' site /></View>
            <View><Icon name='NicoNicoDouga' site /></View>
            <View><Icon name='Youtube' site /></View>
            <View><Icon name='SoundCloud' site /></View>
            <View><Icon name='SoundCloud (Non-Vocaloid)' site /></View>
        </View>
    ));