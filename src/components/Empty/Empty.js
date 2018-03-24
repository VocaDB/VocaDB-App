import React from 'react'
import { View, Text } from 'react-native'
import PropTypes from 'prop-types'
import Icon from './../Icon'
import CenterView from './../CenterView'
import Theme from '../../theme'

class Empty extends React.Component {
    render () {
        return (
            <CenterView>
                {this.props.icon && <Icon name={this.props.icon} size='xlarge' />}
                <Text style={[Theme.headline, { opacity: 0.72 }]}>{this.props.text}</Text>
            </CenterView>
        )
    }
}

Empty.proptypes = {
    text: PropTypes.string,
    icon: PropTypes.string
}

Empty.defaultProps = {
    text: 'No result',
}

export default Empty