import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import AlbumHorizontalList from '../AlbumHorizontalList'
import CenterView from '../../../../components/CenterView/index'
import mockAlbums from './mock'

storiesOf('Album/AlbumHorizontalList', module)
    .addDecorator(getStory => <CenterView>{getStory()}</CenterView>)
    .add('empty', () => (
        <AlbumHorizontalList />
    ))
    .add('with info', () => (
        <AlbumHorizontalList albums={mockAlbums.items} />
    ));