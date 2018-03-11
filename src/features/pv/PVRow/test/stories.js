import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';
import CenterView from '../../../../components/CenterView/index'
import { View } from 'react-native'
import PVRow from '../PVRow'

storiesOf('PV/PVRow', module)
    .addDecorator(getStory => <CenterView type='vertical'>{getStory()}</CenterView>)
    .add('only text', () => (
        <PV name='「ロミオとシンデレラ」　オリジナル曲　vo.初音ミク'
            url='http://www.nicovideo.jp/watch/sm6666016'
            service='Youtube' />
    ))
    .add('with icon', () => (
        <View>
            <PVRow icon
                name='「ロミオとシンデレラ」　オリジナル曲　vo.初音ミク'
                url='http://www.nicovideo.jp/watch/sm6666016'
                service='Youtube' />
            <PVRow icon
                name='「ロミオとシンデレラ」　オリジナル曲　vo.初音ミク'
                url='http://www.nicovideo.jp/watch/sm6666016'
                service='Soundcloud' />
            <PVRow icon
                name='「ロミオとシンデレラ」　オリジナル曲　vo.初音ミク'
                url='http://www.nicovideo.jp/watch/sm6666016'
                service='NicoNicoDouga' />
            <PVRow icon
                name='「ロミオとシンデレラ」　オリジナル曲　vo.初音ミク'
                url='http://www.nicovideo.jp/watch/sm6666016'
                service='Other' />
        </View>

    ))
    .add('with thumbnail', () => (
        <PVRow thumbnail
            name='「ロミオとシンデレラ」　オリジナル曲　vo.初音ミク'
            url='http://www.nicovideo.jp/watch/sm6666016'
            thumbUrl='https://i.ytimg.com/vi/rrCpDYC1P4s/default.jpg'
            service='Youtube'  />
    ));