import React from 'react'
import { connect } from 'react-redux'
import TagDetailPage from './component'
import { createSelector } from 'reselect';
import * as actions from './actions'
import { selectLoading, selectTag, selectTopSongs, selectTopAlbums, selectTopArtists } from './selector'

TagDetailPage.navigationOptions = ({ navigation }) => {

    const { params } = navigation.state;

    return {
        title: params ? '#' + params.title : '#Tag',
    }
}

const tagStateSelect = createSelector(
    selectTag(),
    selectLoading(),
    selectTopSongs(),
    selectTopAlbums(),
    selectTopArtists(),
    (tag, loading, topSongs, topAlbums, topArtists) => ({ tag, loading, topSongs, topAlbums, topArtists })
);


const mapDispatchToProps = (dispatch, props) => ({
    fetchTag: id => dispatch(actions.getTag(id)),
    fetchTopSongs: tagId => dispatch(actions.getTopSongs(tagId)),
    fetchTopArtists: tagId => dispatch(actions.getTopArtists(tagId)),
    fetchTopAlbums: tagId => dispatch(actions.getTopAlbums(tagId)),
    onPressSong: song => props.navigation.navigate('SongDetail', { id: song.id }),
    onPressArtist: artist => props.navigation.navigate('ArtistDetail', { id: artist.id }),
    onPressAlbum: album => props.navigation.navigate('AlbumDetail', { id: album.id }),
})

export default connect(tagStateSelect, mapDispatchToProps)(TagDetailPage)