import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';
import { View, Text } from 'react-native'

import Divider from './index'

storiesOf('Divider', module)
    .add('all', () => (
        <View>
            <Text>Some header 1</Text>
            <Divider />
            <Text>More margin</Text>
            <Divider margin={24} />
            <Text>Some header 2</Text>
            <Divider />
            <Text>Add height</Text>
            <Divider height={8} />
        </View>
    ));