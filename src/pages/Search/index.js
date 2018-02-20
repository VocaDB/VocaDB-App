import React from 'react'
import { connect } from 'react-redux'
import SearchPage from './component'
import * as actions from './actions'
import { createSelector } from 'reselect';
import { selecrLoading, selectEntries, selectQuery } from './selector'
import { Toolbar } from 'react-native-material-ui';
import { TextInput } from 'react-native'

SearchPage.navigationOptions = () => ({
    title: 'Search',
    header: null
})

SearchPage.propTypes = {

}

const searchStateSelect = createSelector(
    selecrLoading(),
    selectEntries(),
    selectQuery(),
    (loading, entries, query) => ({ loading, entries, query })
);

const mapDispatchToProps = (dispatch, props) => ({
    searchEntries: query => dispatch(actions.searchEntries(query)),
    clearSearch: () => dispatch(actions.clearSearch()),
    back: () => props.navigation.goBack(),
    onPressEntry: entry => {
        if(entry.entryType === 'Song') {
            props.navigation.navigate('SongDetail', { id: entry.id })
        } else if(entry.entryType === 'Artist') {
            props.navigation.navigate('ArtistDetail', { id: entry.id })
        } else if(entry.entryType === 'Album') {
            props.navigation.navigate('AlbumDetail', { id: entry.id })
        }
    }
})

export default connect(searchStateSelect, mapDispatchToProps)(SearchPage)