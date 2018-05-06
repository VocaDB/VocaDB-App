import React from 'react'
import { View, Text } from 'react-native'
import PropTypes from 'prop-types'
import WebLink from '../WebLink/index'
import Theme from '../../../theme'
import { ListItem, Button } from 'react-native-material-ui';

class WebLinkList extends React.Component {
    render () {

        let webLinks = this.props.webLinks

        if(this.props.category) {
            webLinks = webLinks.filter(webLink => webLink.category == this.props.category)
        }

        if(!webLinks.length) {
            return (<View></View>)
        }

        const renderItem = webLink => (<WebLink key={webLink.id} name={webLink.description} url={webLink.url} />)

        return (
            <View>
                {this.props.title && <Text style={[Theme.subhead, { paddingHorizontal: 8 }]}>{this.props.title}</Text>}
                {webLinks.map(renderItem)}
            </View>
        )
    }
}

WebLinkList.propTypes = {
    title: PropTypes.string,
    webLinks: PropTypes.array,
    category: PropTypes.string
}

WebLinkList.defaultProps = {
    webLinks: []
}

export default WebLinkList