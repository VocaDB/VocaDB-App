import React from 'react'
import { View, Text } from 'react-native'
import Event from '../EventRow/index'
import PropTypes from 'prop-types';
import Theme from '../../../theme'
import style from './style'
import { Button } from 'react-native-material-ui';

class EventList extends React.Component {

    renderHeader () {
        return (
            <View style={style.header}>
                <View style={style.headerLeft}>
                    <Text style={Theme.subhead}>{this.props.title}</Text>
                </View>
                <View style={style.headerRight}>
                </View>
            </View>
        )
    }

    render () {

        let events = this.props.events.slice(0, this.props.max)
        const isOverLimit = events.length < this.props.events.length

        const renderItem = event => {

            const thumbnailUrl = (event.mainPicture) ? event.mainPicture.urlThumb.replace('mainThumb', 'mainOrig') : undefined
            return  (
                <Event
                    key={event.id}
                    name={event.name}
                    thumbnail={thumbnailUrl}
                    location={event.venueName}
                    date={event.date}
                    onPress={() => this.props.onPressItem(event)}
                />
            )
        }

        return (
            <View>
                {this.props.title && this.renderHeader()}
                {events.map(renderItem)}
                {isOverLimit && <Button primary text="See more" onPress={this.props.onPressMore} />}
            </View>
        )
    }
}

EventList.propTypes = {
    events: PropTypes.array,
    title: PropTypes.string,
    max: PropTypes.number,
    onPressMore: PropTypes.func,
    onPressItem: PropTypes.func
};

EventList.defaultProps = {
    events: [],
    onPressMore: () => {},
    onPressItem: () => {}
};

export default EventList;