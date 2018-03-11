import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';
import CenterView from '../../CenterView/index'

import Cover from '../index'

storiesOf('Components/Cover', module)
    .add('empty', () => (
        <Cover />
    ))
    .add('with values', () => (
        <Cover imageUri='http://tn-skr1.smilevideo.jp/smile?i=6666016'
               title='ロミオとシンデレラ'
               subtitle='doriko feat. 初音ミク'
        />
    ));