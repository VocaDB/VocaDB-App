import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';
import { View, Text } from 'react-native'

import Expander from '../Expander'

const Content = props => (
    <View>
        <Text>Some Content 1</Text>
        <Text>Some Content 2</Text>
        <Text>Some Content 3</Text>
        <Text>Some Content 4</Text>
    </View>
)

storiesOf('Components/Expander', module)
    .add('default', () => (
        <Expander />
    ))
    .add('with content', () => (
        <Expander content={<Content />} />
    ))
    .add('with default show', () => (
        <Expander showContent={true} content={<Content />} />
    ));