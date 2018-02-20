import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';
import { ScrollView } from 'react-native'

import WebLinkList from './index'
import mockWebLinks from './mock'

storiesOf('WebLinkList', module)
    .addDecorator(getStory => <ScrollView>{getStory()}</ScrollView>)
    .add('with all links', () => (
        <WebLinkList webLinks={mockWebLinks.webLinks} />
    ))
    .add('only Reference', () => (
        <WebLinkList webLinks={mockWebLinks.webLinks} category='Reference' title='Reference' />
    ));