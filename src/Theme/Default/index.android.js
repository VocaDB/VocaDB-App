import { COLOR } from 'react-native-material-ui';
import { material, materialColors, systemWeights } from 'react-native-typography'

export default {
    divider: '#1FFFFF',
    primaryColor: COLOR.indigo600,
    statusBarColor: COLOR.indigo800,
    rootBackgroundColor: COLOR.blueGrey100,
    contentBackgroundColor: COLOR.white,
    title: material.title,
    rowTitle: [material.subheading],
    headline: material.headline,
    subhead: [material.subheading, systemWeights.semibold, { color:  materialColors.blackSecondary }],
    body: material.body1,
    caption: material.caption,
    titleWhite: material.titleWhite,
    headlineWhite: material.headlineWhite,
    subheadWhite: material.subheadingWhite,
}