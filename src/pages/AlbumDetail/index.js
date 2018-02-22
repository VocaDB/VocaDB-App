import React from 'react'
import { connect } from 'react-redux'
import AlbumDetailPage from './component'
import * as actions from './actions'
import { createSelector } from 'reselect';
import { selectAlbumResult } from './selector'
import { Share } from 'react-native'

AlbumDetailPage.navigationOptions = () => ({
    title: 'Album',
})

AlbumDetailPage.propTypes = {

}

const albumDetailStateSelect = createSelector(
    selectAlbumResult(),
    (album) => ({ album })
);

const mapDispatchToProps = (dispatch, props) => ({
    fetchAlbum: id => dispatch(actions.getAlbum(id)),
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
    onPressSong: song => props.navigation.navigate('SongDetail', { id: song.id }),
    onPressArtist: artist => props.navigation.navigate('ArtistDetail', { id: artist.id }),
    onPressTag: tag => props.navigation.navigate('TagDetail', { id: tag.id, title: tag.name }),
})

export default connect(albumDetailStateSelect, mapDispatchToProps)(AlbumDetailPage)