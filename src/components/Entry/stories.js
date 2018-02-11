import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import Entry from './index'
import CenterView from './../CenterView'

storiesOf('Entry', module)
    .addDecorator(getStory => <CenterView type='vertical'>{getStory()}</CenterView>)
    .add('general', () => (
        <Entry
            name='桜華P'
            type='Song'
            onPress={action("Press entry")}
        />
    ));