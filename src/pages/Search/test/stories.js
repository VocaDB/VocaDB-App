import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import SearchPage from '../component'
import mockEntries from './mock'

storiesOf('Pages/Search', module)
    .add('with result', () => (
        <SearchPage
            query=''
            loading={false}
            entries={mockEntries.items}
            searchEntries={action('Search entry')}
            clearSearch={action('Clear search')}
            back={action('Back')}
        />
    ));