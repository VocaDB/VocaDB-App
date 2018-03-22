import React from 'react'
import { View, Text, ScrollView, StyleSheet, FlatList } from 'react-native'
import PropTypes from 'prop-types'
import Theme from '../../../theme'
import { Button } from 'react-native-material-ui';

class FeatureList extends React.Component {
    render () {

        const WrapComponent = Component => <View key={Component.key} style={[styles.wrapContainer]}>{Component}</View>

        return (
            <View style={[styles.container]}>
                <View style={[styles.headerContainer]}>
                    <Text style={Theme.subhead}>{this.props.title}</Text>
                    <Button primary text="See more" onPress={this.props.onPressMore} />
                </View>
                <FlatList
                    horizontal
                    showsHorizontalScrollIndicator={false}
                    data={this.props.items}
                    keyExtractor={item => item.id}
                    renderItem={({ item }) => WrapComponent(this.props.renderItem(item))}
                />
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
    items: PropTypes.array,
    renderItem: PropTypes.func,
    onPressMore: PropTypes.func
}

FeatureList.defaultProps = {
    title: 'Unknown',
    items: [],
    onPressMore: () => console.log('Press more')
}

export default FeatureList