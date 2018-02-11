import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';
import { ScrollView } from 'react-native'

import ArtistList from './index'
import mockArtists from './mock'

storiesOf('ArtistList', module)
    .addDecorator(getStory => <ScrollView>{getStory()}</ScrollView>)
    .add('with items', () => (
        <ArtistList
            artists={mockArtists.items}
            onPressItem={action('press artist')}
        />
    ));