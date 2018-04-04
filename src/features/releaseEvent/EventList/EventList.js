import React from 'react'
import { View, Text, FlatList } from 'react-native'
import Event from '../EventRow/index'
import PropTypes from 'prop-types';
import Theme from '../../../theme'
import style from './style'

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

        const renderItem = event => {
            return  (
                <Event
                    key={event.id}
                    name={event.name}
                    thumbnail={event.image}
                    location={event.venueName}
                    date={event.date}
                    onPress={() => this.props.onPressItem(event)}
                />
            )
        }

        return (
            <View>
                {this.props.title && this.renderHeader()}
                <FlatList
                    data={this.props.events}
                    keyExtractor={item => item.id}
                    renderItem={({ item }) => renderItem(item)}
                />
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