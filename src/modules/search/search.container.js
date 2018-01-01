import React from 'react'
import { connect } from 'react-redux'
import SearchView from './search.component'
import { entryRequest, searchCancel, searchTyping } from './search.action'
import { NavigationActions } from "react-navigation";
import { viewSong, viewAlbum, viewArtist } from "../nav/nav.action";

SearchView.navigationOptions = {
    title: 'Searchs'
}

const mapStateToProps = (state, props) => ({
    loading: state.search.loading,
    error: state.search.error,
    entries: state.search.entries,
    query: state.search.query
})

const mapDispatchToProps = dispatch => ({
    back: () => dispatch(NavigationActions.back()),
    clear: () => dispatch(searchCancel()),
    searchEntry: q => (q)? dispatch(entryRequest(q)) : dispatch(searchCancel()),
    viewEntry: (id,entryType) => {
        if (entryType.toLowerCase() == 'song') {
            dispatch(viewSong(id))
        } else if (entryType.toLowerCase() == 'album') {
            dispatch(viewAlbum(id))
        } else if (entryType.toLowerCase() == 'artist') {
            dispatch(viewArtist(id))
        }
    },
    viewSong: id => dispatch(viewSong(id)),
    viewAlbum: id => dispatch(viewAlbum(id)),
    viewArtist: id => dispatch(viewArtist(id))
})

export default connect(mapStateToProps, mapDispatchToProps)(SearchView)