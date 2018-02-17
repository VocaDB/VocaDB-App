import React from 'react'
import { View, Text, ScrollView } from 'react-native'
import { Toolbar } from 'react-native-material-ui';
import EntryList from './../../components/EntryList'

class SearchPage extends React.Component {

    render () {
        return (
            <View>
                <Toolbar
                    isSearchActive={true}
                    centerElement="Searchable"
                    searchable={{
                        autoFocus: true,
                        placeholder: 'Search',
                    }}
                    onLeftElementPress={() => console.log('back')}
                />
                <ScrollView>
                    <EntryList entries={this.props.entries} />
                </ScrollView>

            </View>
        )
    }
}

export default SearchPage
