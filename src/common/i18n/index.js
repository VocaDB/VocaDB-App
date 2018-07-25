import I18n from 'react-native-i18n';
import en from './locales/en';
import th from './locales/th';
import zh from './locales/zh';
import ja from './locales/ja';
import ms from './locales/ms';
import labels from './../constants/labels';
import _ from 'lodash';

I18n.fallbacks = true;
I18n.missingBehaviour='guess';

I18n.translations = {
    en,
    // ja,
    // zh,
    th,
    ms
};

const translate = _.mapValues(labels, v => I18n.t(v));

export default translate;
