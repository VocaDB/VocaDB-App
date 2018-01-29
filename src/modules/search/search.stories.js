import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';
import Entries from './../../sample/entries'

import SearchView from './search.component'

storiesOf('Page', module)
    .add('Search', () => (
        <SearchView
            id={1}
            loading={false}
            error={false}
            entries={Entries.items}
            recentList={[]}
            back={action('pressed back')}
            clear={action('pressed clear')}
            searchEntry={action('pressed entry')}
            viewEntry={action('view entry')}
            viewSong={action('view song')}
            viewAlbum={action('view album')}
            viewArtist={action('view artist')}
            deleteRecent={action('delete recent')}
            clearRecent={action('clear recent')}
        />
    ));