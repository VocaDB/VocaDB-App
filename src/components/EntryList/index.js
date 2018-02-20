import React from 'react'
import { View, Text } from 'react-native'
import Entry from './../Entry'
import PropTypes from 'prop-types';
import images from './../../assets/images'
import { material } from 'react-native-typography'

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

        return (
            <View>
                <Text style={[material.subheading, { margin: 8 }]}>{this.props.title}</Text>
                {this.props.entries.map(renderItem)}
            </View>
        )
    }
}

EntryList.propTypes = {
    title: PropTypes.string,
    entries: PropTypes.array,
    onPressItem: PropTypes.func
};

EntryList.defaultProps = {
    title: 'Entries',
    entries: [],
    onPressItem: () => {}
};

export default EntryList;