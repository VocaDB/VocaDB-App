import React from 'react'
import { View, Text } from 'react-native'
import MenuItem from './../../../components/MenuItem'
import PropTypes from 'prop-types'
import pack from './../../../../package.json'
import AuthContent from './../../user/AuthContent'
import GuestContent from './../../user/GuestContent'

class MenuTab extends React.PureComponent {
    render () {
        return (
            <View style={{ flex: 1 }}>
                <View style={{ flex: 1, backgroundColor: 'white' }}>
                    {this.props.menus.map(props => {

                        const menuItem = (<MenuItem key={props.text} { ...props } />);

                        if(props.onlyMember) {
                            return (
                                <AuthContent key={props.text}>
                                    {menuItem}
                                </AuthContent>
                            )
                        }

                        if(props.onlyGuest) {
                            return (
                                <GuestContent key={props.text}>
                                    {menuItem}
                                </GuestContent>
                            )
                        }

                        return menuItem;
                    })}
                </View>
                <View style={{ height: 40, alignItems: 'center', backgroundColor: 'white' }}>
                    <Text>version {pack.version}</Text>
                </View>
            </View>
        )
    }
}

MenuTab.propTypes = {
    menus: PropTypes.arrayOf(PropTypes.object)
}

MenuTab.defaultProps = {
    menus: []
}

export default MenuTab