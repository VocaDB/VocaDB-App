import React from 'react'
import { connect } from 'react-redux'
import TagDetailPage from './component'
import { createSelector } from 'reselect';
import * as actions from './../../modules/tag/tagActions'
import {
    selectTagDetail,
    selectTopSongs,
    selectTopArtists,
    selectTopAlbums
} from './../../modules/tag/tagSelector'
import { selectLoading } from './../../app/appSelector'

TagDetailPage.navigationOptions = ({ navigation }) => {

    const { params } = navigation.state;

    return {
        title: params ? '#' + params.title : '#Tag',
    }
}

const tagStateSelect = createSelector(
    selectTagDetail(),
    selectLoading(),
    selectTopSongs(),
    selectTopAlbums(),
    selectTopArtists(),
    (tag, loading, topSongs, topAlbums, topArtists) => ({ tag, loading, topSongs, topAlbums, topArtists })
);


const mapDispatchToProps = (dispatch, props) => ({
    fetchTag: id => dispatch(actions.fetchTagDetail(id)),
    fetchTopSongs: tagId => dispatch(actions.fetchTopSongsByTag(tagId)),
    fetchTopArtists: tagId => dispatch(actions.fetchTopArtistsByTag(tagId)),
    fetchTopAlbums: tagId => dispatch(actions.fetchTopAlbumsByTag(tagId)),
    onPressSong: song => props.navigation.navigate('SongDetail', { id: song.id }),
    onPressArtist: artist => props.navigation.navigate('ArtistDetail', { id: artist.id }),
    onPressAlbum: album => props.navigation.navigate('AlbumDetail', { id: album.id }),
})

export default connect(tagStateSelect, mapDispatchToProps)(TagDetailPage)