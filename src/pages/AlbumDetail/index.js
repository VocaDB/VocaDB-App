import React from 'react'
import { connect } from 'react-redux'
import AlbumDetailPage from './component'
import { createSelector } from 'reselect';
import { Share } from 'react-native'
import { selectAlbumDetail } from '../../features/album/albumSelector'
import { fetchAlbumDetail } from '../../features/album/albumActions'

AlbumDetailPage.navigationOptions = () => ({
    title: 'Album',
})

AlbumDetailPage.propTypes = {

}

const albumDetailStateSelect = createSelector(
    selectAlbumDetail(),
    (album) => ({ album })
);

const mapDispatchToProps = (dispatch, props) => ({
    fetchAlbum: id => dispatch(fetchAlbumDetail(id)),
    onPressShare: album => {
        const url = 'http://vocadb.net/Al/' + album.id
        Share.share({
            message: url,
            url: url,
            title: album.name,
        },{
            dialogTitle: 'Share ' + album.name,
        })
    },
    onPressTrack: track => props.navigation.navigate('SongDetail', { id: track.song.id }),
    onPressArtist: artist => props.navigation.navigate('ArtistDetail', { id: artist.id }),
    onPressTag: tag => props.navigation.navigate('TagDetail', { id: tag.id, title: tag.name }),
})

export default connect(albumDetailStateSelect, mapDispatchToProps)(AlbumDetailPage)