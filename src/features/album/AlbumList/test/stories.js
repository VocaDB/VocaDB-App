import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';
import { ScrollView } from 'react-native'

import AlbumList from '../index'
import Horizontal from '../horizontal'
import mockAlbums from './mock'

storiesOf('Album/AlbumList', module)
    .addDecorator(getStory => <ScrollView>{getStory()}</ScrollView>)
    .add('with items', () => (
        <AlbumList
            albums={mockAlbums.items}
            onPressItem={action('press album')}
        />
    ))
    .add('with max 3', () => (
        <AlbumList
            albums={mockAlbums.items}
            max={3}
            onPressItem={action('press album')}
        />
    ))
    .add('with header', () => (
        <AlbumList
            albums={mockAlbums.items}
            title='Recent albums'
            showHeader={true}
            onPressItem={action('press album')}
            onPressMore={action('press more')}
        />
    ))

storiesOf('Album/AlbumList', module)
    .add('with horizontal', () => (
        <AlbumList
            albums={mockAlbums.items}
            title='Recent albums'
            showHeader={true}
            horizontal={true}
            onPressItem={action('press album')}
            onPressMore={action('press more')}
        />
    ));