import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import FeatureList from '../FeatureList'
import CenterView from '../../../../components/CenterView/index'
import SongCard from './../../../song/SongCard'
import { songItems } from './mock'

storiesOf('Main/FeatureList', module)
    .addDecorator(getStory => <CenterView type='vertical'>{getStory()}</CenterView>)
    .add('empty', () => (
        <FeatureList />
    ))
    .add('with song list', () => {

        const renderSongCard = song => <SongCard key={song.id}
                                                 id={song.id}
                                                 name={song.defaultName}
                                                 artist={song.artistString}
                                                 image={song.thumbUrl} />
        const songElements = songItems.map(renderSongCard)

        return (
            <FeatureList
                title='Latest songs'
                items={songElements}
            />
        )
    });