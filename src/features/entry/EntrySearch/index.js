import React from 'react'
import { connect } from 'react-redux'
import EntrySearch from './EntrySearch'
import * as actions from '../entryActions'
import { createSelector } from 'reselect';
import { selectLoading } from '../../../app/appSelector'
import {
    selectEntries,
    selectRecent,
    selectQuery,
    selectHasResult,
    selectSearching
} from '../entrySelector'
import Routes from './../../../app/appRoutes'

EntrySearch.navigationOptions = () => ({
    title: 'Search',
    header: null
})

EntrySearch.propTypes = {

}

const searchStateSelect = createSelector(
    selectLoading(),
    selectEntries(),
    selectQuery(),
    selectRecent(),
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
            props.navigation.navigate(Routes.SongDetail, { id: entry.id, title: entry.defaultName })
        } else if(entry.entryType === 'Artist') {
            props.navigation.navigate(Routes.ArtistDetail, { id: entry.id, title: entry.name })
        } else if(entry.entryType === 'Album') {
            props.navigation.navigate(Routes.AlbumDetail, { id: entry.id, title: entry.name })
        } else if(entry.entryType === 'ReleaseEvent') {
            props.navigation.navigate(Routes.EventDetail, { id: entry.id, title: entry.name })
        }


    },
    onPressClearRecent: () => dispatch(actions.clearRecentSearch()),
    onPressMoreSong: query => {
        const params = {
            title: `More of "${query}"`,
            hideSearchBar: true,
            filterParams: {
                'query': query,
                'maxResults': 20,
                'fields': 'thumbUrl'
            }
        }
        props.navigation.navigate(Routes.SongList, params)
    }
})

export default connect(searchStateSelect, mapDispatchToProps)(EntrySearch)