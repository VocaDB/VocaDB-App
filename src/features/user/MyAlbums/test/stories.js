import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';
import { View } from 'react-native'

import MyAlbums from '../MyAlbums'
import * as mock from './../../../../common/helper/mockGenerator'

const album1 = mock.CreateAlbum({ id: 1 })
const album2 = mock.CreateAlbum({ id: 2 })

const albums = [ album1, album2 ]

storiesOf('User/MyAlbums', module)
    .add('default', () => (
        <MyAlbums />
    ))
    .add('with data', () => (
        <MyAlbums albums={albums} />
    ));