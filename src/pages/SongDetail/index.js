import React from 'react'
import { Share } from 'react-native'
import { connect } from 'react-redux'
import SongDetailPage from './component'
import { createSelector } from 'reselect';
import { fetchSongDetail } from './../../modules/song/songActions'
import { selectSongDetail } from './../../modules/song/songSelector'

SongDetailPage.navigationOptions = () => ({
    title: 'Detail'
})

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
    onPressArtist: artist => props.navigation.navigate('ArtistDetail', { id: artist.id }),
    onPressAlbum: album => props.navigation.navigate('AlbumDetail', { id: album.id }),
    onPressTag: tag => props.navigation.navigate('TagDetail', { id: tag.id, title: tag.name }),
})

export default connect(songDetailStateSelect, mapDispatchToProps)(SongDetailPage)