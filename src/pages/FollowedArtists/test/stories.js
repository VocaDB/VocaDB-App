import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import FollowedArtistsPage from '../component'
import * as mockGenerator from './../../../helper/mockGenerator'

const artist1 = mockGenerator.CreateArtist({ id: 1 })
const artist2 = mockGenerator.CreateArtist({ id: 2 })
const followedArtists = [ artist1, artist2 ]

storiesOf('Pages/FollowedArtists', module)
    .add('with data', () => (
        <FollowedArtistsPage
            followedArtists={followedArtists}
        />
    ));