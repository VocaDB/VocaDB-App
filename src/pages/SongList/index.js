import React from 'react'
import { connect } from 'react-redux'
import SongListPage from './component'
import { createSelector } from 'reselect';
import * as songActions from './../../modules/song/songActions'
import { selectSearchResult } from './../../modules/song/songSelector'
import { selectLoading } from '../../app/appSelector'

SongListPage.navigationOptions = ({ navigation }) => {

    const { params } = navigation.state;

    return {
        title: params ? params.title : 'Songs',
    }
}

const songListStateSelect = createSelector(
    selectSearchResult(),
    selectLoading(),
    (songs, loading) => ({ songs, loading })
);


const mapDispatchToProps = (dispatch, props) => ({
    fetchSongs: params => dispatch(songActions.fetchSearchSongs(params)),
    onPressSong: song => props.navigation.navigate('SongDetail', { id: song.id }),
    onPressTag: tag => props.navigation.navigate('TagDetail', { id: tag.id })
})

export default connect(songListStateSelect, mapDispatchToProps)(SongListPage)