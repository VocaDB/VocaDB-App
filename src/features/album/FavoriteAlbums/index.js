import React from 'react'
import { connect } from 'react-redux'
import FavoriteAlbums from './FavoriteAlbums'
import { selectFavoriteAlbums } from './../albumSelector'
import { createSelector } from 'reselect';
import Routes from './../../../app/appRoutes'

FavoriteAlbums.navigationOptions = ({ navigation }) => {

    const { params } = navigation.state;

    return {
        title: params ? params.title : 'Favorite albums',
    }
}

const mapStateSelector =  createSelector(
    selectFavoriteAlbums(),
    (albums) => ({ albums })
)

const mapDispatchToProps = (dispatch, props) => ({
    onPressAlbum: album => props.navigation.navigate(Routes.AlbumDetail, { id: album.id }),
})

export default connect(mapStateSelector, mapDispatchToProps)(FavoriteAlbums)