import React from 'react'
import { View, Text } from 'react-native'
import PropTypes from 'prop-types'
import Tag from './../Tag'

class TagGroup extends React.Component {
    render () {

        let tags = this.props.tags

        if(this.props.max) {
            tags = tags.slice(0, this.props.max)
        }

        tags = tags.map(tagCount => (<Tag key={tagCount.tag.id} name={tagCount.tag.name} style={{ margin: 4 }} />))

        return (
            <View style={{ flexDirection: 'row', flexWrap: 'wrap', alignItems: 'flex-start' }}>
                {tags}
            </View>
        )
    }
}

TagGroup.propTypes = {
    tags: PropTypes.array,
    onPressTag: PropTypes.func,
    max: PropTypes.number
}

TagGroup.defaultProps = {
    tags: []
}

export default TagGroup;