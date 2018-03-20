import { COLOR } from 'react-native-material-ui';
import { material, materialColors, systemWeights } from 'react-native-typography'

export default {
    divider: '#1FFFFF',
    buttonActiveColor: COLOR.pink400,
    primaryColor: COLOR.indigo600,
    accentColor: COLOR.pink600,
    statusBarColor: COLOR.indigo800,
    rootBackgroundColor: COLOR.blueGrey100,
    contentBackgroundColor: COLOR.white,
    title: material.title,
    rowTitle: [material.body1],
    headline: material.headline,
    subhead: [material.subheading, systemWeights.semibold, { color:  materialColors.blackSecondary }],
    body: material.body1,
    caption: material.caption,
    titleWhite: material.titleWhite,
    headlineWhite: material.headlineWhite,
    subheadWhite: material.subheadingWhite,
}