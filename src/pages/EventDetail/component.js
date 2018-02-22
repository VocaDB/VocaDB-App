import React from 'react'
import { View, Text, Image, Linking } from 'react-native'
import Icon from './../../components/Icon'
import { ListItem, Button } from 'react-native-material-ui';
import Content from './../../components/Content'
import Theme from './../../theme'
import moment from 'moment'

class EventDetailPage extends React.Component {

    componentDidMount () {
        const { params } = this.props.navigation.state
        if(params) {
            this.props.fetchEvent(params.id)
        }
    }

    render () {
        const event = this.props.event
        const webLinks = (event.webLinks)? event.webLinks : []
        const imageUrl = (event.mainPicture) ? event.mainPicture.urlThumb.replace('mainThumb', 'mainOrig')
            : 'http://via.placeholder.com/350x150/000000/ffffff/NO_IMAGE';

        const renderRowInfo = (icon, value, onPress) => (
            <ListItem
                leftElement={<Icon name={icon} />}
                centerElement={{
                    primaryText: value,
                }}
                onPress={() => {}}
            />
        )

        const officialLink = webLinks.find(webLink => webLink.category === 'Official')
        const renderLink = () => (officialLink)? (
            <ListItem
                leftElement={<Icon name='ios-globe' />}
                centerElement={{
                    primaryText: 'Website',
                }}
                onPress={() => {}}
            />
        ) : (<View></View>)

        return (
            <Content>
                <View style={{ height: 240, justifyContent: 'center' }}>
                    <Image
                        style={{ flex: 1, margin: 24 }}
                        source={{ uri: imageUrl }}
                        resizeMode='contain'
                    />
                </View>
                <View>
                    <Text style={[Theme.title, { alignSelf: 'center', margin: 8 }]}>{event.name}</Text>
                    {event.description && <Text style={[Theme.subhead, { alignSelf: 'center', margin: 8 }]}>{event.description}</Text>}

                    {renderRowInfo('ios-calendar', moment(event.date).format('dddd, MMMM Do YYYY'), () => this.props.onPressDate(event.date))}
                    {event.venueName && renderRowInfo('ios-locate', event.venueName, () => this.props.onPressLocation(event.venueName))}
                    {officialLink && renderRowInfo('ios-globe', 'Website', () => this.props.onPressWebsite(officialLink.url))}
                </View>

            </Content>
        )
    }
}

export default EventDetailPage