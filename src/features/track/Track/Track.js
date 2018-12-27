import React from 'react';
import { View, Text, UIManager, TouchableOpacity, ActionSheetIOS, Platform, findNodeHandle } from 'react-native';
import PropTypes from 'prop-types';
import Theme from '../../../theme';
import Icon from '../../../components/Icon/index';
import i18n from './../../../common/i18n';
import MaterialIcons from 'react-native-vector-icons/MaterialIcons';

class Track extends React.Component {
    render () {

        return (
            <TouchableOpacity  onPress={this.props.onPress} style={
                [{ backgroundColor: '#ffffff', padding: 8, flexDirection: 'row', justifyContent: 'space-between', height: 72 },
                    this.props.style]}>
                <View style={{ width: 32, alignItems: 'center' }}>
                    <Text style={Theme.subhead}>{this.props.trackNumber}</Text>
                </View>
                <View style={{ flex: 1, paddingHorizontal: 8 }}>
                    <Text style={Theme.body}>{this.props.name}</Text>
                    {this.props.artist.length > 0 && <Text style={Theme.caption}>{this.props.artist}</Text>}
                    {this.props.pvServices.length > 0 && (
                        <View style={{ flexDirection: 'row', alignItems: 'center' }}>
                            {this.props.pvServices.map(pvService =>
                                <Icon style={{ marginRight: 4 }} key={pvService} name={pvService} size='small' site />)}
                        </View>
                    )}
                </View>
                <View style={{ justifyContent: 'center' }}>
                    <Icon name='md-more' onPress={() => {

                        if(Platform.OS === 'ios') {
                            ActionSheetIOS.showActionSheetWithOptions({
                                    options: [i18n.cancel, i18n.share],
                                    cancelButtonIndex: 0,
                                },
                                (buttonIndex) => {
                                    if (buttonIndex === 1) {
                                        this.props.onPressShare();
                                    }
                                });
                        } else {
                            UIManager.showPopupMenu(
                                findNodeHandle(<MaterialIcons name="share" />),
                                [ 'Share' ],
                                () => { console.log('Popup Error') },
                                this.props.onPressShare
                            )
                        }

                    }} />
                </View>
            </TouchableOpacity>
        )
    }
}

Track.propTypes = {
    name: PropTypes.string,
    artist: PropTypes.string,
    pvServices: PropTypes.array,
    onPress: PropTypes.func,
    onPressShare: PropTypes.func,
    trackNumber: PropTypes.number
}

Track.defaultProps = {
    pvServices: [],
    onPress: () => console.log('No action'),
    onPressShare: () => console.log('No action onPressShare')
}

export default Track;