import React from 'react';
import { View, Text, TouchableOpacity } from 'react-native';
import PropTypes from 'prop-types';
import Tag from '../Tag/index';
import Theme from '../../../theme';
import i18n from './../../../common/i18n';

class TagGroup extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
            showAll: false
        };
    }

    render () {

        let tags = this.props.tags
        let isTagOverMax = (this.props.max && tags.length > this.props.max);

        if(!this.state.showAll && this.props.max) {
            tags = tags.slice(0, this.props.max);
        }

        tags = tags.map(tagCount => (<Tag key={tagCount.tag.id} name={tagCount.tag.name} style={{ margin: 4 }} onPress={() => this.props.onPressTag(tagCount.tag)} />))

        const showAllButton = () => (
            <TouchableOpacity  onPress={() => this.setState({ showAll: true })} style={[style.showAll]}>
                <Text style={style.text}>{`${i18n.showAll} (${this.props.tags.length})`}</Text>
            </TouchableOpacity>
        );

        return (
            <View style={{ flexDirection: 'row', flexWrap: 'wrap', alignItems: 'flex-start' }}>
                {tags}
                {isTagOverMax && !this.state.showAll && showAllButton()}
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


const style = {
    showAll: {
        paddingHorizontal: 16, paddingVertical: 8,
        flexDirection: 'row',
        justifyContent: 'space-between',
        alignItems: 'center',
        borderRadius: 25,
        backgroundColor: Theme.primaryColor
    },
    text: {
        color: 'white',
        fontWeight: 'bold'
    }
}

export default TagGroup;