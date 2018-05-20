import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import TagSearch from '../TagSearch'

storiesOf('Tag/TagSearch', module)
    .add('default', () => (
        <TagSearch />
    ));