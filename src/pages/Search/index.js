import React from 'react'
import { connect } from 'react-redux'
import SearchPage from './component'
import * as actions from './actions'
import { createSelector } from 'reselect';
import { selecrLoading, selectEntries } from './selector'
import { Toolbar } from 'react-native-material-ui';
import { TextInput } from 'react-native'

SearchPage.navigationOptions = () => ({
    title: 'Search',
    header: null
})

SearchPage.propTypes = {

}

// const mapStateToProps = state => ({
//
// })

const searchStateSelect = createSelector(
    selecrLoading(),
    selectEntries(),
    (loading, entries) => ({ loading, entries })
);

const mapDispatchToProps = (dispatch, props) => ({
    searchEntries: query => dispatch(actions.searchEntries(query)),
    clearSearch: () => dispatch(actions.clearSearch()),
    back: () => props.navigation.goBack(),
    onPressEntry: (id, entryType) => {
        if(entryType === 'Song') {
            props.navigation.navigate('SongDetail', { id })
        }
    }
})

export default connect(searchStateSelect, mapDispatchToProps)(SearchPage)