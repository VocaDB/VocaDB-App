import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import AlbumSearch from '../AlbumSearch'

storiesOf('Album/AlbumSearch', module)
    .add('normal', () => (
        <AlbumSearch />
    ));