import React from 'react'
import { View, Text, Modal, StyleSheet } from 'react-native'
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
        this.props.fetchEvent()
    }

    getNavigationParams() {
        return (this.props.navigation.state && this.props.navigation.state.params)? this.props.navigation.state.params : {};
    }

    renderList () {

        return (
            <Content>
                <EventList
                    events={this.props.events}
                    onPressItem={this.props.onPressEvent}
                    refreshing={this.props.loading}
                    onEndReached={() => {
                        if(!this.props.isNoResult) {
                            this.props.fetchMoreEvent()
                        }
                    }}
                    hideMoreButton={true} />
            </Content>
        )
    }

    render () {

        const params = this.getNavigationParams();

        const renderFilterButton = () => {
            if(params.hideSearchBar) {
                return null;
            }

            return (
                <View style={styles.menuContainer}>
                    <Button raised primary icon='tune' text='Filter' style={{ container: styles.filterButton }} onPress={this.props.onPressFilter} />
                </View>
            )
        }

        return (
            <Page>
                <Toolbar
                    leftElement="arrow-back"
                    onLeftElementPress={this.props.back}
                    centerElement="Events"
                    searchable={{
                        autoFocus: true,
                        placeholder: 'Find event',
                        onChangeText: this.props.onSearch
                    }}
                />

                {renderFilterButton()}

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

const styles = StyleSheet.create({
    menuContainer: {
        alignItems: 'center',
        backgroundColor: 'white'
    },
    filterButton: {
        margin: 8,
        width: 128
    },
    resultContainer: {
        flex: 1,
        backgroundColor: Theme.contentBackgroundColor,
        paddingBottom: 8
    }
})

EventSearch.defaultProps = {
    events: []
}