import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';
import { ScrollView } from 'react-native'

import EntryList from '../EntryList'
import mockEntrys from './mock'

storiesOf('Entry/EntryList', module)
    .addDecorator(getStory => <ScrollView>{getStory()}</ScrollView>)
    .add('with items', () => (
        <EntryList
            entries={mockEntrys.items}
            onPressItem={action('press entry')}
        />
    ));