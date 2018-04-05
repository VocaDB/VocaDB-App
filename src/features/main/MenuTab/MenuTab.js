import React from 'react'
import { View } from 'react-native'
import MenuItem from './../../../components/MenuItem'
import PropTypes from 'prop-types'

class MenuTab extends React.PureComponent {
    render () {
        return (
            <View style={{ flex: 1 }}>
                <View style={{ flex: 1, backgroundColor: 'white' }}>
                    {this.props.menus.map(props => <MenuItem key={props.text} { ...props } />)}
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