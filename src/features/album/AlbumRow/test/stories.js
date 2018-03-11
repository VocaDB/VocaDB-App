import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import Album from '../index'
import CenterView from '../../../../components/CenterView'
import images from '../../../../common/assets/images'

storiesOf('Album/AlbumRow', module)
    .addDecorator(getStory => <CenterView type='vertical'>{getStory()}</CenterView>)
    .add('as row', () => (
        <Album
            id={6255}
            image='https://static.vocadb.net/img/album/mainThumb/6255.jpg?v=3'
            name='This is album row'
            artist='桜華P, No,666 feat. GUMI'
            display='row'
            onPress={action("Press album")}
        />
    ));

storiesOf('Album/AlbumRow', module)
    .addDecorator(getStory => <CenterView>{getStory()}</CenterView>)
    .add('as box', () => (
        <Album
            id={6255}
            image='https://static.vocadb.net/img/album/mainThumb/6255.jpg?v=3'
            name='"666" NUMBER TRIPLE SIX'
            artist='桜華P, No,666 feat. GUMI'
            display='box'
            onPress={action("Press album")}
        />
    ));