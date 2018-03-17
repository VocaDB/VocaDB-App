import Theme from '../../../theme'

export default {
    container: {
        paddingHorizontal: 16, paddingVertical: 8,
        flexDirection: 'row',
        justifyContent: 'space-between',
        borderRadius: 25
    },
    default: {
        backgroundColor: Theme.primaryColor
    },
    selected: {
        backgroundColor: Theme.accentColor
    },
    text: {
        color: 'white',
        fontWeight: 'bold'
    }
}