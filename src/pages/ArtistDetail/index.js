import React from 'react'
import { connect } from 'react-redux'
import ArtistDetailPage from './component'
import * as actions from './actions'
import { createSelector } from 'reselect';
import { selectArtistResult } from './selector'
import { Share } from 'react-native'

ArtistDetailPage.navigationOptions = () => ({
    title: 'Detail',
})

ArtistDetailPage.propTypes = {

}

const artistDetailStateSelect = createSelector(
    selectArtistResult(),
    (artist) => ({ artist })
);

const mapDispatchToProps = (dispatch, props) => ({
    fetchArtist: id => dispatch(actions.getArtist(id)),
    onPressShare: artist => {
        const url = 'http://vocadb.net/Ar/' + artist.id
        Share.share({
            message: url,
            url: url,
            title: artist.defaultName,
        },{
            dialogTitle: 'Share ' + artist.defaultName,
        })
    },
    onPressSong: song => props.navigation.navigate('SongDetail', { id: song.id }),
    onPressAlbum: album => props.navigation.navigate('AlbumDetail', { id: album.id }),
    onPressTag: tag => props.navigation.navigate('TagDetail', { id: tag.id, title: tag.name }),
    onPressMoreLatestSongs: artist => props.navigation.navigate('SongList', {
        title: 'Latest songs of ' + artist.name,
        params: {
            'maxResults': 20,
            'sort': 'AdditionDate',
            'artistId': artist.id,
            'fields': 'thumbUrl'
        }
    })
})

export default connect(artistDetailStateSelect, mapDispatchToProps)(ArtistDetailPage)