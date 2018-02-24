import React from 'react'
import { View } from 'react-native'
import Theme from './../../theme'
import PropTypes from 'prop-types'

class Divider extends React.Component {
    render () {
        return (
            <View style={{
                backgroundColor: 'black',
                opacity: 0.12,
                height: this.props.height,
                marginVertical: this.props.margin
            }}>
            </View>
        )
    }
}

Divider.propTypes = {
    margin: PropTypes.number,
    height: PropTypes.number
}

Divider.defaultProps = {
    margin: 8,
    height: 1,
}

export default Divider;