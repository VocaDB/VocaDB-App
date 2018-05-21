import React from 'react'
import { View, Text } from 'react-native'
import Entry from '../EntryRow/index'
import PropTypes from 'prop-types';
import images from '../../../common/assets/images'
import { material } from 'react-native-typography'
import { Button } from 'react-native-material-ui';

class EntryList extends React.Component {

    render () {

        const renderItem = entry => {
            return  (
                <Entry
                    key={entry.id}
                    id={entry.id}
                    name={entry.name}
                    entryType={entry.entryType}
                    caption={entry.artistString}
                    thumbnail={entry.image}
                    onPress={() => this.props.onPressItem(entry)}
                />
            )
        }

        let entries = this.props.entries.slice(0, this.props.max)
        const isOverLimit = entries.length < this.props.entries.length

        const renderTitle = () => {
            if(!this.props.title) {
                return null;
            }

            return (
                <Text style={[material.subheading, { margin: 8 }]}>{this.props.title}</Text>
            )
        }

        return (
            <View>
                {renderTitle()}
                {entries.map(renderItem)}
                {isOverLimit && <Button primary text="See more" onPress={this.props.onPressMore} />}
            </View>
        )
    }
}

EntryList.propTypes = {
    title: PropTypes.string,
    entries: PropTypes.array,
    onPressItem: PropTypes.func,
    onPressMore: PropTypes.func,
    max: PropTypes.number
};

EntryList.defaultProps = {
    title: '',
    entries: [],
    onPressItem: () => {},
    onPressMore: () => {}
};

export default EntryList;