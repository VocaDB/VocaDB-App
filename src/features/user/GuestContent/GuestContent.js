import React from 'react'
import { View, Text } from 'react-native'
import PropTypes from 'prop-types'
import config from './../../../common/constants/config'

class GuestContent extends React.PureComponent {
    render () {

        if(this.props.isAuthenticated || !config.enableAuth) {
            return null;
        }

        return (
            <View>
                {this.props.children}
            </View>
        )
    }
}

GuestContent.propTypes = {
    isAuthenticated: PropTypes.bool
}

GuestContent.defaultProps = {
    isAuthenticated: false
}

export default GuestContent;