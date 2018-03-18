import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import AlbumCard from '../AlbumCard'
import CenterView from '../../../../components/CenterView/index'

storiesOf('Album/AlbumCard', module)
    .addDecorator(getStory => <CenterView>{getStory()}</CenterView>)
    .add('empty', () => (
        <AlbumCard />
    ))
    .add('with info', () => (
        <AlbumCard
            id={6255}
            image='https://static.vocadb.net/img/album/mainThumb/6255.jpg?v=3'
            name='This is album row'
            artist='桜華P, No,666 feat. GUMI'
            onPress={action("Press album")}
        />
    ));