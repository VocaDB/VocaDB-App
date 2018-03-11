import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import Entry from '../EntryRow'
import CenterView from '../../../../components/CenterView/index'

storiesOf('Entry', module)
    .addDecorator(getStory => <CenterView type='vertical'>{getStory()}</CenterView>)
    .add('song', () => (
        <Entry
            id={184450}
            name='crystal mic'
            entryType='Song'
            thumbnail='http://tn.smilevideo.jp/smile?i=32748137'
            onPress={action("Press entry")}
        />
    ))
    .add('song without thumbnail', () => (
        <Entry
            id={184450}
            name='crystal mic'
            entryType='Song'
            onPress={action("Press entry")}
        />
    ))
    .add('artist', () => (
        <Entry
            id={64568}
            name='earthborn'
            entryType='Artist'
            onPress={action("Press entry")}
        />
    ))
    .add('album', () => (
        <Entry
            id={24251}
            name='Cakes And Stroke'
            entryType='Album'
            onPress={action("Press entry")}
        />
    ))
    .add('other', () => (
        <Entry
            id={1715}
            name="KAITO's Birthday 2018"
            entryType='Event'
            onPress={action("Press entry")}
        />
    ));