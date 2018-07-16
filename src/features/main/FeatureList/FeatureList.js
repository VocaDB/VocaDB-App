import React from 'react'
import { View, Text, ScrollView, StyleSheet, FlatList } from 'react-native'
import PropTypes from 'prop-types'
import Theme from '../../../theme'
import { Button } from 'react-native-material-ui';
import i18n from './../../../common/i18n';

class FeatureList extends React.PureComponent {

    renderPrefix() {
        return (this.props.prefix)? this.props.prefix : null;
    }

    render () {

        const WrapComponent = Component => <View key={Component.key} style={[styles.wrapContainer]}>{Component}</View>

        return (
            <View style={[styles.container]}>
                <View style={[styles.headerContainer]}>
                    <View style={{ alignItems: 'center', flexDirection: 'row', justifyContent: 'center' }}>
                        {this.renderPrefix()}
                        <Text style={Theme.subhead}>{this.props.title}</Text>
                    </View>
                    {this.props.displayMoreButton && <Button primary text={i18n.seeMore} onPress={this.props.onPressMore} />}
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
        marginTop: 4,
        marginHorizontal: 8,
        flexDirection: 'row',
        justifyContent: 'space-between',
        alignItems: 'center'
    },
    contentContainer: {
        paddingHorizontal: 8,
        marginHorizontal: 8
    }
});

FeatureList.propTypes = {
    title: PropTypes.string,
    items: PropTypes.array,
    renderItem: PropTypes.func,
    onPressMore: PropTypes.func,
    displayMoreButton: PropTypes.bool,
    prefix: PropTypes.element
}

FeatureList.defaultProps = {
    title: 'Unknown',
    items: [],
    displayMoreButton: true,
    onPressMore: () => console.log('Press more')
}

export default FeatureList