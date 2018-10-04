import React from 'react';
import { connect } from 'react-redux';
import SongShowAll from './SongShowAll';
import { createSelector } from 'reselect';
import { selectSongsFromCurrentSongShowAll } from './../songSelector';
import Routes from './../../../app/appRoutes';
import i18n from './../../../common/i18n';

SongShowAll.navigationOptions = ({ navigation }) => {

    const { params } = navigation.state;

    const navOptions = {
        title: params ? params.title : i18n.songs,
    }

    if(params && params.hideHeader) {
        navOptions.header = null;
    }

    return navOptions;
}

const songShowAllState = createSelector(
    selectSongsFromCurrentSongShowAll(),
    (songs) => ({ songs })
);

const mapDispatchToProps = (dispatch, props) => ({
    onPressSong: song => props.navigation.navigate(Routes.SongDetail, { title: song.name, id: song.id })
})

export default connect(songShowAllState, mapDispatchToProps)(SongShowAll);