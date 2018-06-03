import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { View, Text } from 'react-native'

import Section from '../Section'

const Content = props => (
    <View>
        <Text>Some Content 1</Text>
        <Text>Some Content 2</Text>
        <Text>Some Content 3</Text>
        <Text>Some Content 4</Text>
    </View>
)

storiesOf('Components/Section', module)
    .add('default', () => (
        <Section>
            <Content />
        </Section>
    ))
    .add('with title', () => (
        <Section title='Description'>
            <Content />
        </Section>
    ))
    .add('hide', () => (
        <View>
            <Text>Test hide section</Text>
            <Section show={false}>
                <Content />
            </Section>
        </View>
    ));