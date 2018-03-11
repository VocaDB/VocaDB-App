import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';
import { ScrollView } from 'react-native'

import ArtistList from '../ArtistList'
import mockArtists from './mock'

storiesOf('Artist/ArtistList', module)
    .addDecorator(getStory => <ScrollView>{getStory()}</ScrollView>)
    .add('with items', () => (
        <ArtistList
            artists={mockArtists.items}
            onPressItem={action('press artist')}
        />
    ));

storiesOf('Artist/ArtistList', module)
    .add('with horizontal', () => (
        <ArtistList
            artists={mockArtists.items}
            horizontal={true}
            onPressItem={action('press album')}
        />
    ));