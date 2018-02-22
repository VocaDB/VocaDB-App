import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import TagPage from '../component'
import mockTag from './mock'

storiesOf('Pages/Tag', module)
    .add('normal', () => (
        <TagPage
            tag={mockTag}
            fetchTag={action('Fetch tag')}
        />
    ));