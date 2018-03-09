import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';
import CenterView from '../../../components/CenterView/index'
import { View } from 'react-native'
import PV from './index'

storiesOf('PV', module)
    .addDecorator(getStory => <CenterView type='vertical'>{getStory()}</CenterView>)
    .add('only text', () => (
        <PV name='「ロミオとシンデレラ」　オリジナル曲　vo.初音ミク'
            url='http://www.nicovideo.jp/watch/sm6666016'
            service='Youtube' />
    ))
    .add('with icon', () => (
        <View>
            <PV icon
                name='「ロミオとシンデレラ」　オリジナル曲　vo.初音ミク'
                url='http://www.nicovideo.jp/watch/sm6666016'
                service='Youtube' />
            <PV icon
                name='「ロミオとシンデレラ」　オリジナル曲　vo.初音ミク'
                url='http://www.nicovideo.jp/watch/sm6666016'
                service='Soundcloud' />
            <PV icon
                name='「ロミオとシンデレラ」　オリジナル曲　vo.初音ミク'
                url='http://www.nicovideo.jp/watch/sm6666016'
                service='NicoNicoDouga' />
            <PV icon
                name='「ロミオとシンデレラ」　オリジナル曲　vo.初音ミク'
                url='http://www.nicovideo.jp/watch/sm6666016'
                service='Other' />
        </View>

    ))
    .add('with thumbnail', () => (
        <PV thumbnail
            name='「ロミオとシンデレラ」　オリジナル曲　vo.初音ミク'
            url='http://www.nicovideo.jp/watch/sm6666016'
            thumbUrl='https://i.ytimg.com/vi/rrCpDYC1P4s/default.jpg'
            service='Youtube'  />
    ));