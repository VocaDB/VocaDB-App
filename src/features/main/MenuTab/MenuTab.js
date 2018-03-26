import React from 'react'
import { View, Text } from 'react-native'
import Divider from '../../../components/Divider'
import MenuItem from './../../../components/MenuItem'
import { Button } from 'react-native-material-ui';
import Theme from '../../../theme'
import CenterView from '../../../components/CenterView'
import PropTypes from 'prop-types'

class MenuTab extends React.PureComponent {
    render () {
        return (
            <View style={{ flex: 1 }}>
                <View style={{ flex: 1, backgroundColor: 'white' }}>
                    <MenuItem icon='ios-musical-notes' text='Favorite songs' onPress={this.props.onPressMenuFavoriteSongs} />
                    <MenuItem icon='ios-people' text='Followed artists' onPress={this.props.onPressMenuFollowArtists} />
                    <MenuItem icon='ios-settings' text='Settings' onPress={this.props.onPressMenuSettings} />
                    <MenuItem icon='ios-lock' text='Terms & privacy policy' onPress={this.props.onPressMenuPolicy} />
                    <MenuItem icon='ios-help-circle' text='Help & feedback' onPress={this.props.onPressMenuHelp} />
                </View>
            </View>
        )
    }
}

MenuTab.propTypes = {
    onPressSignIn: PropTypes.func,
    onPressMenuFavoriteSongs: PropTypes.func,
    onPressMenuFollowArtists: PropTypes.func,
    onPressMenuSettings: PropTypes.func,
    onPressMenuPolicy: PropTypes.func,
    onPressMenuHelp: PropTypes.func
}

export default MenuTab