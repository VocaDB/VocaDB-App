import React from 'react'
import { Share } from 'react-native'
import { connect } from 'react-redux'
import SongDetailPage from './component'
import * as actions from './actions'
import { createSelector } from 'reselect';
import { selectSongResult } from './selector'

SongDetailPage.navigationOptions = () => ({
    title: 'Detail'
})

SongDetailPage.propTypes = {

}

const songDetailStateSelect = createSelector(
    selectSongResult(),
    (song) => ({ song })
);

const mapDispatchToProps = (dispatch, props) => ({
    fetchSong: id => dispatch(actions.getSong(id)),
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
})

export default connect(songDetailStateSelect, mapDispatchToProps)(SongDetailPage)