import React from 'react';
import { View, Text } from 'react-native';
import PropTypes from 'prop-types'
import Theme from '../../theme'

class Section extends React.Component {
    render () {

        if(!this.props.show) return null;

        return (
            <View style={{ paddingHorizontal: 4 }}>
                {this.props.title.length > 0 && <Text style={[Theme.subhead, { padding: 8 }]}>{this.props.title}</Text>}
                {this.props.children}
            </View>
        )
    }
}

Section.propTypes  = {
    title: PropTypes.string,
    show: PropTypes.bool,
}

Section.defaultProps = {
    title: '',
    show: true
}

export default Section;