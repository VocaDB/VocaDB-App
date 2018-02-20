import React from 'react'
import { connect } from 'react-redux'
import AlbumDetailPage from './component'
import * as actions from './actions'
import { createSelector } from 'reselect';
import { selectAlbumResult } from './selector'

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
    fetchAlbum: id => dispatch(actions.getAlbum(id))
})

export default connect(albumDetailStateSelect, mapDispatchToProps)(AlbumDetailPage)