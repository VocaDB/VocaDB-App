import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import MenuItem from '../MenuItem'
import { View } from 'react-native'
import CenterView from '../../CenterView/index'

storiesOf('Components/MenuItem', module)
    .addDecorator(getStory => <CenterView type='vertical'>{getStory()}</CenterView>)
    .add('normal', () => (
        <View>
            <MenuItem icon='ios-settings' text='Setting' onPress={action('Press item')} />
            <MenuItem icon='ios-search' text='Search' onPress={action('Press item')} />
            <MenuItem icon='ios-person' text='Artist' onPress={action('Press item')} />
        </View>

    ));