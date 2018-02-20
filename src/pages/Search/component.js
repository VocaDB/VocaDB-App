import React from 'react'
import { View, Text, ScrollView, StatusBar } from 'react-native'
import CenterView from './../../components/CenterView'
import { Toolbar } from 'react-native-material-ui';
import EntryList from './../../components/EntryList'
import Header from './../../components/Header'
import { material } from 'react-native-typography'
import { SafeAreaView } from 'react-navigation';
import { Constants } from 'expo'
import Icon from './../../components/Icon'
import { statusBarColor, rootBackgroundColor } from './../../theme'

class SearchPage extends React.Component {

    render () {


        const BlankContent = () => (
            <CenterView>
                <View>
                    <Text style={material.body1}>Find anything here</Text>
                </View>
            </CenterView>
        )

        const Resultcontent = () => (
            <EntryList entries={this.props.entries} onPressItem={this.props.onPressEntry} />
        )

        return (
            <View style={{ backgroundColor: statusBarColor, flex: 1 }}>
                <Header>
                    <Toolbar
                        leftElement="arrow-back"
                        centerElement='Search'
                        searchable={{
                            autoFocus: true,
                            onChangeText: text => {
                                if(text) {
                                    this.props.searchEntries(text)
                                } else {
                                    this.props.clearSearch()
                                }
                            },
                            onSearchClosed: this.props.clearSearch
                        }}
                        onLeftElementPress={this.props.back}
                        onRightElementPress={this.props.clearSearch}
                    />
                </Header>
                <View style={{ backgroundColor: rootBackgroundColor, flex: 1 }}>
                    {this.props.entries && <Resultcontent/>}
                    {!this.props.entries.length && <BlankContent/>}
                </View>
            </View>
        )
    }
}

export default SearchPage
