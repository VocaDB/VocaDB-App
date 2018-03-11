import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import FollowedArtists from '../FollowedArtists'
import * as mockGenerator from '../../../../common/helper/mockGenerator'

const artist1 = mockGenerator.CreateArtist({ id: 1 })
const artist2 = mockGenerator.CreateArtist({ id: 2 })
const followedArtists = [ artist1, artist2 ]

storiesOf('Artist/FollowedArtists', module)
    .add('with data', () => (
        <FollowedArtists
            followedArtists={followedArtists}
        />
    ));