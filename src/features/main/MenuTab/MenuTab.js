import React from 'react'
import { View, Text } from 'react-native'
import Divider from '../../../components/Divider'
import MenuItem from './../../../components/MenuItem'
import { Button } from 'react-native-material-ui';
import Theme from '../../../theme'
import CenterView from '../../../components/CenterView'
import PropTypes from 'prop-types'

class MenuTab extends React.Component {
    render () {
        return (
            <View style={{ flex: 1 }}>
                <CenterView>
                    <Text style={[Theme.subhead,{ margin: 8 }]}>This app is still under development.</Text>
                    <Button raised text="Sign in" />
                </CenterView>
                <View style={{ flex: 1, backgroundColor: 'white' }}>
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
    onPressMenuFollowArtists: PropTypes.func,
    onPressMenuSettings: PropTypes.func,
    onPressMenuPolicy: PropTypes.func,
    onPressMenuHelp: PropTypes.func
}

export default MenuTab