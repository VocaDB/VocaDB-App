import React from 'react'
import {View, Text, TouchableOpacity, StyleSheet, FlatList, Image} from 'react-native'
import PropTypes from 'prop-types'
import Theme from '../../../theme'
import { Button } from 'react-native-material-ui';
import i18n from './../../../common/i18n';

class EventSongList extends React.PureComponent {

    renderPrefix() {
        return (this.props.prefix)? this.props.prefix : null;
    }

    render () {

        const WrapComponent = Component => <View key={Component.key} style={[styles.wrapContainer]}>{Component}</View>

        const HeadComponent = props => (
            <View style={[styles.wrapContainer]}>
                <TouchableOpacity style={{
                    flex: 1,
                    width: 250,
                    height: 150
                }} onPress={this.props.onPressMore}>
                    <Image
                        style={{
                            flex: 1
                        }}
                        source={{ uri: props.image }}
                        resizeMode='cover'
                        resizeMethod='resize'
                    />
                </TouchableOpacity>

                <Text style={[Theme.subhead, { paddingHorizontal: 8, paddingVertical: 4, textAlign: 'center' }]} textAlign='center'>{props.title}</Text>
            </View>
        )

        return (
            <View style={[styles.container]}>
                <Image
                    style={{flex: 1, backgroundColor: '#FFFFFF', opacity: 0.57 }}
                    source={{ uri: this.props.image }}
                    resizeMode='cover'
                    resizeMethod='resize'
                    blurRadius={3}
                />
                <View style={{
                    position: 'absolute',
                    backgroundColor: 'transparent',
                    flex: 1,
                    alignItems: 'center',
                    alignSelf: 'center',
                    justifyContent: 'center'
                }}>
                    <FlatList
                        style={{ flex: 1 }}
                        horizontal
                        showsHorizontalScrollIndicator={false}
                        data={this.props.items}
                        keyExtractor={item => item.id}
                        renderItem={({ item, index }) => {

                            if(index === 0) {
                                console.log(this.props.image)
                                return <HeadComponent
                                    title={this.props.title}
                                    image={this.props.image}
                                />
                            }

                            return WrapComponent(this.props.renderItem(item));
                        }}
                    />

                </View>

            </View>
        )
    }
}

const styles = StyleSheet.create({
    container: {
        backgroundColor: 'white',
        height: 200
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

EventSongList.propTypes = {
    title: PropTypes.string,
    items: PropTypes.array,
    renderItem: PropTypes.func,
    onPressMore: PropTypes.func,
    displayMoreButton: PropTypes.bool,
    prefix: PropTypes.element
}

EventSongList.defaultProps = {
    title: 'Unknown',
    items: [],
    displayMoreButton: true,
    onPressMore: () => console.log('Press more')
}

export default EventSongList