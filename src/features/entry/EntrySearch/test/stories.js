import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import EntrySearch from '../EntrySearch'
import mockEntries from './mock'

storiesOf('Entry/Search', module)
    .add('with result', () => (
        <EntrySearch
            query=''
            loading={false}
            entries={mockEntries.items}
            searchEntries={action('Search entry')}
            clearSearch={action('Clear search')}
            back={action('Back')}
        />
    ));