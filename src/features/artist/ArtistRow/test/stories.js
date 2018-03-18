import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import ArtistRow from '../ArtistRow'
import CenterView from '../../../../components/CenterView/index'

storiesOf('Artist/ArtistRow', module)
    .addDecorator(getStory => <CenterView type='vertical'>{getStory()}</CenterView>)
    .add('general', () => (
        <ArtistRow
            id={1910}
            name='桜華P'
            onPress={action("Press artist")}
        />
    ))
    .add('with type', () => (
        <ArtistRow
            id={1910}
            name='桜華P'
            type='Producer'
            onPress={action("Press artist")}
        />
    ))
    .add('with role', () => (
        <ArtistRow
            id={1}
            name='初音ミク'
            role='Vocaloid'
            onPress={action("Press artist")}
        />
    ))
    .add('only avatar', () => (
        <ArtistRow
            id={1}
            display='avatar'
            onPress={action("Press artist")}
        />
    ))
    .add('right icon', () => (
        <ArtistRow
            id={1}
            name='初音ミク'
            rightIcon='ios-close'
            onPress={action("Press artist")}
            onRightElementPress={action('Press right element')}
        />
    ));