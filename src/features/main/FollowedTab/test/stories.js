import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import FollowedTab from '../FollowedTab'
import CenterView from '../../../../components/CenterView/index'
import { songItems } from './mock'

storiesOf('Main/FollowedTab', module)
    .addDecorator(getStory => <CenterView type='vertical'>{getStory()}</CenterView>)
    .add('empty', () => (
        <FollowedTab />
    ))
    .add('with song', () => (
        <FollowedTab songs={songItems} onPressSong={action('Press song')} />
    ));