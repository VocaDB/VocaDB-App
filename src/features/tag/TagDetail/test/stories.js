import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import TagPage from '../TagDetail'

storiesOf('Tag/TagDetail', module)
    .add('normal', () => (
        <TagPage
            fetchTag={action('Fetch tag')}
        />
    ));