import React from 'react'
import { Share } from 'react-native'
import { connect } from 'react-redux'
import SongDetailPage from './SongDetail'
import { createSelector } from 'reselect';
import * as songActions from '../songActions'
import { selectSongDetail, selectIsFavoriteSong, selectAlbums } from '../songSelector'
import Routes from './../../../app/appRoutes'

SongDetailPage.navigationOptions = ({ navigation }) => {

    const { params } = navigation.state;

    const navOptions = {
        title: (params && params.title) ? params.title : 'Detail',
    }

    if(params.hideHeader) {
        navOptions.header = null
    }

    return navOptions
}

SongDetailPage.propTypes = {

}

const songDetailStateSelect = createSelector(
    selectSongDetail(),
    selectIsFavoriteSong(),
    selectAlbums(),
    (song, isFavoriteSong, albums) => ({ song, isFavoriteSong, albums })
);

const mapDispatchToProps = (dispatch, props) => ({
    fetchSong: id => dispatch(songActions.fetchSongDetail(id)),
    onPressFavorite: song => dispatch(songActions.addFavoriteSong(song)),
    onPressUnfavorite: song => dispatch(songActions.removeFavoriteSong(song)),
    onPressShare: song => {
        const url = 'https://vocadb.net/S/' + song.id
        Share.share({
            message: url,
            url: url,
            title: song.defaultName,
        },{
            dialogTitle: 'Share ' + song.defaultName,
        })
    },
    onPressArtist: artist => props.navigation.navigate(Routes.ArtistDetail, { id: artist.id, title: artist.name }),
    onPressAlbum: album => props.navigation.navigate(Routes.AlbumDetail, { id: album.id, title: album.name }),
    onPressTag: tag => props.navigation.navigate(Routes.TagDetail, { id: tag.id, title: tag.name }),
})

export default connect(songDetailStateSelect, mapDispatchToProps)(SongDetailPage)