import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import AlbumGridView from '../AlbumGridView'
import CenterView from '../../../../components/CenterView/index'
import mockAlbums from './mock'

storiesOf('Album/AlbumGridView', module)
    .add('empty', () => (
        <AlbumGridView />
    ))
    .add('with info', () => (
        <AlbumGridView albums={mockAlbums.items} />
    ));