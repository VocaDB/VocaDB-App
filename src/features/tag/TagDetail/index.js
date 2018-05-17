import React from 'react'
import { connect } from 'react-redux'
import TagDetail from './TagDetail'
import { createSelector } from 'reselect';
import * as actions from '../tagActions'
import {
    selectTagDetail,
    selectTopSongs,
    selectTopArtists,
    selectTopAlbums,
    selectTagDetailLatestSongs
} from '../tagSelector'
import { selectLoading } from '../../../app/appSelector'
import Routes from './../../../app/appRoutes'
import { tagDetailUrl } from './../../../common/constants/config'
import { Linking } from 'react-native'

TagDetail.navigationOptions = ({ navigation }) => {

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
    onPressSong: song => props.navigation.navigate(Routes.SongDetail, { id: song.id, title: song.defaultName }),
    onPressArtist: artist => props.navigation.navigate(Routes.ArtistDetail, { id: artist.id, title: artist.name }),
    onPressAlbum: album => props.navigation.navigate(Routes.AlbumDetail, { id: album.id, title: album.name }),
    onPressTag: tag => props.navigation.navigate(Routes.TagDetail, { id: tag.id, title: tag.name }),
    onPressToVocaDB: tag => {
        if(!tag || !tag.id) {
            return;
        }
        Linking.openURL(tagDetailUrl(tag.id)).catch(err => console.error('An error occurred', err))
    }
})

export default connect(tagStateSelect, mapDispatchToProps)(TagDetail)