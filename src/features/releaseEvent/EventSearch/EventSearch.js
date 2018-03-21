import React from 'react'
import { View, Text, Modal } from 'react-native'
import { Button, Toolbar } from 'react-native-material-ui';
import Page from '../../../components/Page/index'
import Content from '../../../components/Content'
import CenterView from '../../../components/CenterView/index'
import EventList from '../EventList'
import Theme from '../../../theme'

export default class EventSearch extends React.Component {

    state = {
        filterVisible: false,
    };

    constructor(props) {
        super(props)
    }

    componentDidMount () {
        this.refresh()
    }

    doSearch(params) {
        this.props.fetchEvents(params)
    }

    refresh() {
        this.props.fetchEventsReplaceParams()
    }

    renderList () {

        return (
            <Content>
                <EventList
                    events={this.props.events}
                    onPressItem={this.props.onPressEvent}
                    refreshing={this.props.loading}
                    onRefresh={this.refresh.bind(this)}
                    onEndReached={() => {
                        if(!this.props.isNoResult) {
                            this.doSearch({ start: this.props.events.length })
                        }
                    }}
                    hideMoreButton={true} />
            </Content>
        )
    }

    render () {
        return (
            <Page>
                <Toolbar
                    leftElement="arrow-back"
                    onLeftElementPress={this.props.back}
                    centerElement="Events"
                    searchable={{
                        autoFocus: true,
                        placeholder: 'Find event',
                        onChangeText: text => {
                            this.doSearch({ query: text, start: 0 })
                        }
                    }}
                />
                <View style={{ flex: 1, backgroundColor: Theme.contentBackgroundColor, paddingBottom: 8 }}>
                    {this.props.events.length > 0 && this.renderList()}
                    {this.props.events.length === 0 && <CenterView>
                        <Text>No result</Text>
                    </CenterView>}
                </View>
            </Page>
        )
    }
}

EventSearch.defaultProps = {
    events: []
}