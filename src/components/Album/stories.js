import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import Album from './index'
import CenterView from './../CenterView'
import images from './../../assets/images'

storiesOf('Album', module)
    .addDecorator(getStory => <CenterView type='vertical'>{getStory()}</CenterView>)
    .add('as row', () => (
        <Album
            image={images.getAlbumUri(6255)}
            name='"666" NUMBER TRIPLE SIX'
            artist='桜華P, No,666 feat. GUMI'
            onPress={action("Press album")}
        />
    ));

storiesOf('Album', module)
    .addDecorator(getStory => <CenterView>{getStory()}</CenterView>)
    .add('as box', () => (
        <Album
            image={images.getAlbumUri(6255)}
            display='box'
            name='"666" NUMBER TRIPLE SIX'
            artist='桜華P, No,666 feat. GUMI'
            onPress={action("Press album")}
        />
    ));