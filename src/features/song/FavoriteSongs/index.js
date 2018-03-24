import React from 'react'
import { connect } from 'react-redux'
import FavoriteSongs from './FavoriteSongs'
import { selectFavoriteSongs } from './../songSelector'
import { createSelector } from 'reselect';
import Routes from './../../../app/appRoutes'

FavoriteSongs.navigationOptions = ({ navigation }) => {

    const { params } = navigation.state;

    return {
        title: params ? params.title : 'Favorite songs',
    }
}

const mapStateSelector =  createSelector(
    selectFavoriteSongs(),
    (songs) => ({ songs })
)

const mapDispatchToProps = (dispatch, props) => ({
    onPressSong: song => props.navigation.navigate(Routes.SongDetail, { id: song.id }),
})

export default connect(mapStateSelector, mapDispatchToProps)(FavoriteSongs)