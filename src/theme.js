import { StyleSheet } from 'react-native'
import { COLOR } from 'react-native-material-ui';

export const primaryColor = COLOR.indigo600
export const statusBarColor = COLOR.indigo800
export const rootBackgroundColor = COLOR.blueGrey100

export default StyleSheet.create({
    displayReverse_1: {
        fontSize: 20,
        fontWeight: '800',
        lineHeight: 26,
        color: 'white'
    },
    displayReverse_2: {
        fontSize: 16,
        lineHeight: 26,
        color: 'white'
    },
    displayReverse_3: {
        fontSize: 14,
        lineHeight: 20,
        color: 'white'
    },
    headline: {
        fontSize: 20,
        fontWeight: '300',
        lineHeight: 26,
        opacity: 0.87
    },
    title: {
        fontSize: 16,
        fontWeight: '300',
        lineHeight: 25,
        opacity: 0.87
    },
    subHeading: {
        fontSize: 14,
        opacity: 0.54
    },
    body: {
        fontSize: 14,
        opacity: 0.87
    },
    caption: {
        fontSize: 12,
        opacity: 0.54
    }
})