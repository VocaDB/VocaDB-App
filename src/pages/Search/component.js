import React from 'react'
import { View, Text, ScrollView } from 'react-native'
import { Toolbar } from 'react-native-material-ui';
import EntryList from './../../components/EntryList'
import { SafeAreaView } from 'react-navigation';
import { statusBarColor, rootBackgroundColor } from './../../theme'

class SearchPage extends React.Component {

    render () {
        return (
            <View style={{ backgroundColor: statusBarColor}}>
                <SafeAreaView style={{ backgroundColor: rootBackgroundColor }}>
                    <Toolbar
                        leftElement="arrow-back"
                        isSearchActive={true}
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
                    <ScrollView>
                        <EntryList entries={this.props.entries} onPressItem={this.props.onPressEntry} />
                    </ScrollView>

                </SafeAreaView>
            </View>
        )
    }
}

export default SearchPage
