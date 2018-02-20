import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';
import { View } from 'react-native'

import TagGroup from './index'
import mockTags from './mock'

storiesOf('TagGroup', module)
    .add('all tags', () => (
        <TagGroup tags={mockTags.tags} onPressTag={action('Press tag')}  />
    ))
    .add('limit 5', () => (
        <TagGroup tags={mockTags.tags} max={5} onPressTag={action('Press tag')} />
    ));