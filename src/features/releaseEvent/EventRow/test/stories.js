import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';

import EventRow from '../EventRow'
import CenterView from '../../../../components/CenterView/index'
import images from '../../../../common/assets/images'

storiesOf('Event/EventRow', module)
    .addDecorator(getStory => <CenterView type='vertical'>{getStory()}</CenterView>)
    .add('general', () => (
        <EventRow
            name='"666" NUMBER TRIPLE SIX'
            onPress={action("Press event")}
            thumbnail="https://static.vocadb.net/img/releaseeventseries/mainOrig/88.png?v=4"
        />
    ));