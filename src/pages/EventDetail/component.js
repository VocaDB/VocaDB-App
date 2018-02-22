import React from 'react'
import { View, Text } from 'react-native'

class EventDetailPage extends React.Component {

    componentDidMount () {
        const { params } = this.props.navigation.state
        if(params) {
            this.props.fetchEvent(params.id)
        }
    }

    render () {
        const event = this.props.event

        return (
            <View>
                <Text>Event</Text>
                <Text>Name : {event.name}</Text>
                <Text>Date : {event.date}</Text>
            </View>
        )
    }
}

export default EventDetailPage