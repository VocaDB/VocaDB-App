import React from 'react';
import { View, Text } from 'react-native'

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import SongType from '../SongType'
import { songTypeName } from './../../songConstant'
import CenterView from '../../../../components/CenterView/index'

storiesOf('Song/SongType', module)
    .addDecorator(getStory => <CenterView>{getStory()}</CenterView>)
    .add('default', () => (
        <View>
            <SongType type={songTypeName.original} />
            <SongType type={songTypeName.remaster} />
            <SongType type={songTypeName.remix} />
            <SongType type={songTypeName.cover} />
            <SongType type={songTypeName.instrumental} />
            <SongType type={songTypeName.mashup} />
            <SongType type={songTypeName.musicPV} />
            <SongType type={songTypeName.dramaPV} />
            <SongType  />
        </View>
    ));