import I18n from 'react-native-i18n';
import en from './locales/en';
import th from './locales/th';
import zh from './locales/zh';
import ja from './locales/ja';

I18n.fallbacks = true;

I18n.translations = {
    en,
    ja,
    zh,
    th
};

export default I18n;