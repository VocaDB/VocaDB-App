import React from 'react'
import { View, Text } from 'react-native'
import Icon from './../Icon'
import PropTypes from 'prop-types'

class Expander extends React.Component {


    constructor(props) {
        super(props)
        this.state = {
            showContent: this.props.showContent
        }
    }

    showContent() {
        this.setState({ showContent: true })
    }

    hideContent() {
        this.setState({ showContent: false })
    }

    render () {

        if(this.state.showContent) {
            return (
                <View>
                    {this.props.content}
                    <View style={{ alignItems: 'center' }}>
                        <Icon name='ios-arrow-up' size='small' onPress={() => this.hideContent()} />
                    </View>
                </View>
            )
        }

        return (
            <View>
                <View style={{ alignItems: 'center' }}>
                    <Icon name='ios-arrow-down' size='small' onPress={() => this.showContent()} />
                </View>
            </View>
        )
    }
}

Expander.propTypes = {
    showContent: PropTypes.bool,
    content: PropTypes.element
}

Expander.defaultProps = {
    showContent: false,
    content: <View></View>
}

export default Expander;