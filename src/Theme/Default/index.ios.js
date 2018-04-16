import { COLOR } from 'react-native-material-ui';
import { human, iOSColors } from 'react-native-typography'

export default {
    divider: COLOR.lightBlue300,
    buttonActiveColor: COLOR.pink400,
    primaryColor: COLOR.indigo600,
    accentColor: COLOR.pink600,
    error: [human.body, { color: COLOR.red600 }],
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