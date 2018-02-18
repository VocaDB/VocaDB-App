import React from 'react'
import { View, Text } from 'react-native'
import Entry from './../Entry'
import PropTypes from 'prop-types';
import images from './../../assets/images'

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
                    thumbnail={thumbnailUrl}
                    onPress={() => this.props.onPressItem(entry.id, entry.entryType)}
                />
            )
        }

        return (
            <View>
                {this.props.entries.map(renderItem)}
            </View>
        )
    }
}

EntryList.propTypes = {
    entries: PropTypes.array,
    onPressItem: PropTypes.func
};

EntryList.defaultProps = {
    entries: [],
    onPressItem: () => {}
};

export default EntryList;