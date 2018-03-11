import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';
import { View } from 'react-native'

import Tag from '../Tag'
import CenterView from '../../../../components/CenterView/index'

storiesOf('Tag/Tag', module)
    .addDecorator(getStory => <CenterView>{getStory()}</CenterView>)
    .add('with name', () => (
        <Tag name='Project Diva' />
    ));