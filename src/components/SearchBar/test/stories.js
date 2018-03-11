import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import SearchBar from '../index'

storiesOf('Components/SearchBar', module)
    .add('general', () => (
        <SearchBar
            onPressClear={action('Press clear')}
            onLeftElementPress={action('Press back')}
            onChangeText={action('Input')}
            onRightElementPress={action('Press right element')}
        />
    ))
    .add('with text', () => (
        <SearchBar
            text='something'
            onPressClear={action('Press clear')}
            onLeftElementPress={action('Press back')}
            onChangeText={action('Input')}
            onRightElementPress={action('Press right element')}
        />
    ));