import { COLOR } from 'react-native-material-ui';
import { human, iOSColors } from 'react-native-typography'

export default {
    divider: COLOR.lightBlue300,
    primaryColor: COLOR.indigo600,
    statusBarColor: COLOR.indigo800,
    rootBackgroundColor: COLOR.blueGrey100,
    contentBackgroundColor: COLOR.white,
    title: human.title3,
    rowTitle: [human.subhead],
    headline: human.headline,
    subhead: [human.subhead, { color: iOSColors.black }],
    body: human.body,
    caption: human.caption1,
    titleWhite: human.title3White,
    headlineWhite: human.headlineWhite,
    subheadWhite: human.subheadWhite,
}