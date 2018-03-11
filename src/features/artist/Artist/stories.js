import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import Artist from './index'
import CenterView from '../../../components/CenterView/index'

storiesOf('Artist', module)
    .addDecorator(getStory => <CenterView type='vertical'>{getStory()}</CenterView>)
    .add('general', () => (
        <Artist
            id={1910}
            name='桜華P'
            onPress={action("Press artist")}
        />
    ))
    .add('with type', () => (
        <Artist
            id={1910}
            name='桜華P'
            type='Producer'
            onPress={action("Press artist")}
        />
    ))
    .add('with role', () => (
        <Artist
            id={1}
            name='初音ミク'
            role='Vocaloid'
            onPress={action("Press artist")}
        />
    ))
    .add('only avatar', () => (
        <Artist
            id={1}
            display='avatar'
            onPress={action("Press artist")}
        />
    ));