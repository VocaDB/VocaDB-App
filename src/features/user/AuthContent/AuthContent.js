import React from 'react'
import { View, Text } from 'react-native'
import PropTypes from 'prop-types'
import config from './../../../common/constants/config'

class AuthContent extends React.PureComponent {
    render () {

        if(!this.props.isAuthenticated || !config.enableAuth) {
            return null;
        }

        return (
            <View>
                {this.props.children}
            </View>
        )
    }
}

AuthContent.propTypes = {
    isAuthenticated: PropTypes.bool
}

AuthContent.defaultProps = {
    isAuthenticated: false
}

export default AuthContent;