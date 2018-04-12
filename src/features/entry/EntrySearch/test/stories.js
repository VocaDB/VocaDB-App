import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import EntrySearch from '../EntrySearch'
import mockEntries from './mock'

storiesOf('Entry/Search', module)
    .add('Initial', () => (
        <EntrySearch
            searchEntries={action('Search entry')}
            clearSearch={action('Clear search')}
            back={action('Back')}
        />
    ))
    .add('with result', () => (
        <EntrySearch
            query='abc'
            entries={mockEntries.items}
            searchEntries={action('Search entry')}
            clearSearch={action('Clear search')}
            back={action('Back')}
        />
    ))
    .add('with recent list', () => (
        <EntrySearch
            recentList={mockEntries.items}
            searchEntries={action('Search entry')}
            clearSearch={action('Clear search')}
            back={action('Back')}
        />
    ))

    .add('no result', () => (
        <EntrySearch
            query='abc'
            entries={[]}
            searchEntries={action('Search entry')}
            clearSearch={action('Clear search')}
            back={action('Back')}
        />
    ));