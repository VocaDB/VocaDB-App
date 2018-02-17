import React from 'react'
import { View, Text, ScrollView } from 'react-native'
import { Toolbar } from 'react-native-material-ui';
import EntryList from './../../components/EntryList'
import { SafeAreaView } from 'react-navigation';

class SearchPage extends React.Component {

    render () {
        return (
            <SafeAreaView>
                <Toolbar
                    isSearchActive={true}
                    centerElement="Searchable"
                    searchable={{
                        autoFocus: true,
                        placeholder: 'Search',
                        onChangeText: text => {
                            if(text) {
                                this.props.searchEntries(text)
                            } else {
                                this.props.clearSearch()
                            }
                        },
                        onSearchClosed: this.props.clearSearch
                    }}
                    onRightElementPress={this.props.clearSearch}
                    onLeftElementPress={() => console.log('back')}
                />
                <ScrollView>
                    <EntryList entries={this.props.entries} />
                </ScrollView>

            </SafeAreaView>
        )
    }
}

export default SearchPage
