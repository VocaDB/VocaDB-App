import React from 'react'
import { View, Text } from 'react-native'
import Event from './../Event'
import PropTypes from 'prop-types';
import images from './../../assets/images'

class EventList extends React.Component {

    render () {

        const renderItem = event => {

            const thumbnailUrl = (event.mainPicture) ? event.mainPicture.urlThumb.replace('mainThumb', 'mainOrig') : undefined
            return  (
                <Event
                    key={event.id}
                    name={event.name}
                    thumbnail={thumbnailUrl}
                    location={event.venueName}
                    date={event.date}
                    onPress={() => this.props.onPressItem(event.id)}
                />
            )
        }

        return (
            <View>
                {this.props.events.map(renderItem)}
            </View>
        )
    }
}

EventList.propTypes = {
    events: PropTypes.array,
    onPressItem: PropTypes.func
};

EventList.defaultProps = {
    events: [],
    onPressItem: () => {}
};

export default EventList;