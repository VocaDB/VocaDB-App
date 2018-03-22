import React from 'react'
import { Share } from 'react-native'
import { connect } from 'react-redux'
import SongDetailPage from './SongDetail'
import { createSelector } from 'reselect';
import { fetchSongDetail } from '../songActions'
import { selectSongDetail } from '../songSelector'
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
    (song) => ({ song })
);

const mapDispatchToProps = (dispatch, props) => ({
    fetchSong: id => dispatch(fetchSongDetail(id)),
    onPressShare: song => {
        const url = 'http://vocadb.net/S/' + song.id
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