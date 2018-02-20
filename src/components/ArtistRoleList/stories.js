import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';
import { ScrollView } from 'react-native'

import ArtistRoleList from './index'
import mockArtists from './mock'

storiesOf('ArtistRoleList', module)
    .addDecorator(getStory => <ScrollView>{getStory()}</ScrollView>)
    .add('Vocaloid', () => (
        <ArtistRoleList
            artists={mockArtists.artists}
            category='Vocalist'
            title='Vocalist'
            onPressItem={action('press artist')}
        />
    ))
    .add('Other', () => (
        <ArtistRoleList
            artists={mockArtists.artists}
            category='Other'
            title='Other'
            displayRole={true}
            onPressItem={action('press artist')}
        />
    ));