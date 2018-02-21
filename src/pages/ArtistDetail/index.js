import React from 'react'
import { connect } from 'react-redux'
import ArtistDetailPage from './component'
import * as actions from './actions'
import { createSelector } from 'reselect';
import { selectArtistResult } from './selector'

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
    onPressSong: song => props.navigation.navigate('SongDetail', { id: song.id }),
    onPressAlbum: album => props.navigation.navigate('AlbumDetail', { id: album.id }),
})

export default connect(artistDetailStateSelect, mapDispatchToProps)(ArtistDetailPage)