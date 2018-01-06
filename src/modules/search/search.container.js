import React from 'react'
import { connect } from 'react-redux'
import SearchView from './search.component'
import {entryRequest, searchCancel, searchTyping, saveRecent, readRecent} from './search.action'
import { NavigationActions } from "react-navigation";
import { viewSong, viewAlbum, viewArtist } from "../nav/nav.action";

SearchView.navigationOptions = {
    title: 'Searchs'
}

const mapStateToProps = (state, props) => ({
    loading: state.search.loading,
    error: state.search.error,
    entries: state.search.entries,
    query: state.search.query,
    recentList: state.search.recentList
})

const mapDispatchToProps = dispatch => ({
    back: () => dispatch(NavigationActions.back()),
    initRecentSearch: () => dispatch(readRecent()),
    clear: () => dispatch(searchCancel()),
    searchEntry: q => (q)? dispatch(entryRequest(q)) : dispatch(searchCancel()),
    viewEntry: entry => {
        const id = entry.id
        const entryType = entry.entryType
        if (entryType.toLowerCase() == 'song') {
            dispatch(viewSong(id))
        } else if (entryType.toLowerCase() == 'album') {
            dispatch(viewAlbum(id))
        } else if (entryType.toLowerCase() == 'artist') {
            dispatch(viewArtist(id))
        } else {
            return;
        }

        dispatch(saveRecent(entry))
    },
    viewSong: id => dispatch(viewSong(id)),
    viewAlbum: id => dispatch(viewAlbum(id)),
    viewArtist: id => dispatch(viewArtist(id))
})

export default connect(mapStateToProps, mapDispatchToProps)(SearchView)