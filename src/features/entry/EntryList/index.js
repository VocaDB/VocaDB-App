import React from 'react'
import { View, Text } from 'react-native'
import Entry from '../Entry/index'
import PropTypes from 'prop-types';
import images from '../../../common/assets/images'
import { material } from 'react-native-typography'
import { Button } from 'react-native-material-ui';

class EntryList extends React.Component {

    render () {

        const renderItem = entry => {

            const thumbnailUrl = (entry.mainPicture) ? entry.mainPicture.urlThumb : undefined

            return  (
                <Entry
                    key={entry.id}
                    id={entry.id}
                    name={entry.defaultName}
                    entryType={entry.entryType}
                    caption={entry.artistString}
                    thumbnail={thumbnailUrl}
                    onPress={() => this.props.onPressItem(entry)}
                />
            )
        }

        let entries = this.props.entries.slice(0, this.props.max)
        const isOverLimit = entries.length < this.props.entries.length

        return (
            <View>
                <Text style={[material.subheading, { margin: 8 }]}>{this.props.title}</Text>
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
    title: 'Entries',
    entries: [],
    onPressItem: () => {},
    onPressMore: () => {}
};

export default EntryList;