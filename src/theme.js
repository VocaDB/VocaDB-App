import { Platform } from 'react-native'
import DefaultAndroid from './Theme/Default/index.android'
import DefaultIOS from './Theme/Default/index.ios'

export default (Platform.OS === 'ios')? DefaultIOS : DefaultAndroid