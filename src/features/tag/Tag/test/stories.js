import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';
import { View } from 'react-native'

import Tag from '../Tag'
import CenterView from '../../../../components/CenterView/index'

storiesOf('Tag/Tag', module)
    .addDecorator(getStory => <CenterView>{getStory()}</CenterView>)
    .add('normal', () => (
        <Tag name='Project Diva' />
    ))
    .add('selected', () => (
        <Tag name='Project Diva' selected />
    ))
    .add('with remove button', () => (
        <Tag name='Project Diva' showRemoveButton onRemovePress={() => action('Press right element')} />
    ));