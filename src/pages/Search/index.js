import React from 'react'
import { connect } from 'react-redux'
import SearchPage from './component'
import * as actions from './actions'
import { createSelector } from 'reselect';
import { selectLoading, selectEntries, selectQuery, selectRecentList, selectHasResult, selectSearching } from './selector'

SearchPage.navigationOptions = () => ({
    title: 'Search',
    header: null
})

SearchPage.propTypes = {

}

const searchStateSelect = createSelector(
    selectLoading(),
    selectEntries(),
    selectQuery(),
    selectRecentList(),
    selectHasResult(),
    selectSearching(),
    (loading, entries, query, recentList, hasResult, searching) => ({ loading, entries, query, recentList, hasResult, searching })
);

const mapDispatchToProps = (dispatch, props) => ({
    searchEntries: query => dispatch(actions.searchEntries(query)),
    clearSearch: () => dispatch(actions.clearSearch()),
    back: () => props.navigation.goBack(),
    onPressEntry: entry => {

        dispatch(actions.saveRecentSearch(entry))

        if(entry.entryType === 'Song') {
            props.navigation.navigate('SongDetail', { id: entry.id })
        } else if(entry.entryType === 'Artist') {
            props.navigation.navigate('ArtistDetail', { id: entry.id })
        } else if(entry.entryType === 'Album') {
            props.navigation.navigate('AlbumDetail', { id: entry.id })
        }


    },
    onPressClearRecent: () => dispatch(actions.clearRecentSearch()),
    onPressMoreSong: query => {
        const params = {
            title: 'More of ' + query,
            params: {
                'query': query,
                'maxResults': 20,
                'fields': 'thumbUrl'
            }
        }
        props.navigation.navigate('SongList', params)
    }
})

export default connect(searchStateSelect, mapDispatchToProps)(SearchPage)