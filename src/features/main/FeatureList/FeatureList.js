import React from 'react'
import { View, Text, ScrollView, StyleSheet } from 'react-native'
import PropTypes from 'prop-types'
import Theme from '../../../theme'
import { Button } from 'react-native-material-ui';

class FeatureList extends React.Component {
    render () {

        const WrapComponent = Component => <View key={Component.key} style={[styles.wrapContainer]}>{Component}</View>

        return (
            <View style={[styles.container]}>
                <View style={[styles.headerContainer]}>
                    <Text style={Theme.headline}>{this.props.title}</Text>
                    <Button primary text="See more" onPress={this.props.onPressMore} />
                </View>
                <ScrollView horizontal>
                    {this.props.items.map(WrapComponent)}
                </ScrollView>

            </View>
        )
    }
}

const styles = StyleSheet.create({
    container: {
        backgroundColor: 'white'
    },
    wrapContainer: {
        margin: 8
    },
    headerContainer: {
        margin: 8,
        flexDirection: 'row',
        justifyContent: 'space-between',
        alignItems: 'center'
    },
    contentContainer: {
        padding: 8,
        margin: 8
    }
});

FeatureList.propTypes = {
    title: PropTypes.string,
    items: PropTypes.arrayOf(PropTypes.element),
    onPressMore: PropTypes.func
}

FeatureList.defaultProps = {
    title: 'Unknown',
    items: [],
    onPressMore: () => console.log('Press more')
}

export default FeatureList