import React from 'react';

import { storiesOf } from '@storybook/react-native';
import { action } from '@storybook/addon-actions';
import { Provider } from 'react-redux';
import store from './../../../../app/appStore';

import SongFilter from '../SongFilter'

storiesOf('Song/SongFilter', module)
    .add('init', () => (
        <Provider store={store}>
            <SongFilter
                params={{ tagId: [ 127, 160 ], songTypes: '', tagName: [ { id: 1, name: 'A' }, { id: 2, name: 'B' } ] }}
                onPressSave={action('Press save')}
                onPressBack={action('Press back')}
            />
        </Provider>
    ));